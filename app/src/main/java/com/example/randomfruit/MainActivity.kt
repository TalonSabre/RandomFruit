package com.example.randomfruit

// Made by CPW on 2/14/2023

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.randomfruit.databinding.ActivityMainBinding
import kotlin.random.Random


class MainActivity: AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding

    private var odds: Int = 0
    private var fruitNum: Int = 0
    private var fruitImg: String = ""
    private var caliber: Int = 1
    private var caliberImg: String = ""

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.genButton.setOnClickListener { genFruit() }
    }

    private fun getCaliberTxt(): String {
        when (caliber) {
            1 -> return getString(R.string.oneStar)
            2 -> return getString(R.string.twoStar)
            3 -> return getString(R.string.threeStar)
            4 -> return getString(R.string.fourStar)
            5 -> return getString(R.string.fiveStar)
            6 -> return getString(R.string.sixStar)
        }
        return getString(R.string.oneStar)
    }

    private fun getCaliber(): Int {
        when (fruitNum) {
            0 -> return 1
            1 -> return 1
            2 -> return 1
            3 -> return 1
            4 -> return 1
            5 -> return 1
            6 -> return 1
            7 -> return 1

            8 -> return 2
            9 -> return 2
            10 -> return 2
            11 -> return 2
            12 -> return 2

            13 -> return 3
            14 -> return 3
            15 -> return 3
            16 -> return 3
            17 -> return 3

            18 -> return 4
            19 -> return 4
            20 -> return 4
            21 -> return 4

            22 -> return 5
            23 -> return 5
            24 -> return 5

            25 -> return 6
            26 -> return 6
            27 -> return 6
        }
        return 0
    }

    private fun getFruitTxt(): String {
        when (fruitNum) {
            0 -> return getString(R.string.apple)
            1 -> return getString(R.string.orange)
            2 -> return getString(R.string.peach)
            3 -> return getString(R.string.pear)
            4 -> return getString(R.string.strawberry)
            5 -> return getString(R.string.cherries)
            6 -> return getString(R.string.blueberries)
            7 -> return getString(R.string.grapes)

            8 -> return getString(R.string.greenApple)
            9 -> return getString(R.string.lemon)
            10 -> return getString(R.string.watermelon)
            11 -> return getString(R.string.banana)
            12 -> return getString(R.string.melon)

            13 -> return getString(R.string.pineapple)
            14 -> return getString(R.string.kiwi)
            15 -> return getString(R.string.tomato)
            16 -> return getString(R.string.mango)
            17 -> return getString(R.string.avocado)

            18 -> return getString(R.string.corn)
            19 -> return getString(R.string.potato)
            20 -> return getString(R.string.cheese)
            21 -> return getString(R.string.chili)

            22 -> return getString(R.string.mushroom)
            23 -> return getString(R.string.onion)
            24 -> return getString(R.string.peanuts)

            25 -> return getString(R.string.lollipop)
            26 -> return getString(R.string.donut)
            27 -> return getString(R.string.burger)
        }
        return getString(R.string.apple)
    }

    private fun getFruitNum(): Int {
        when {
            // Common
            //
            odds < 500 -> return 0
            odds < 1000 -> return 1
            odds < 1500 -> return 2
            odds < 2000 -> return 3
            odds < 2500 -> return 4
            odds < 3000 -> return 5
            odds < 3500 -> return 6
            odds < 4000 -> return 7
            // Uncommon
            //
            odds < 4400 -> return 8
            odds < 4800 -> return 9
            odds < 5200 -> return 10
            odds < 5600 -> return 11
            odds < 6000 -> return 12
            // Rare
            //
            odds < 6300 -> return 13
            odds < 6600 -> return 14
            odds < 6900 -> return 15
            odds < 7200 -> return 16
            odds < 7500 -> return 17
            // Very Rare
            //
            odds < 7700 -> return 18
            odds < 7900 -> return 19
            odds < 8100 -> return 20
            odds < 8300 -> return 21
            // Epic
            //
            odds < 8400 -> return 22
            odds < 8500 -> return 23
            odds < 8600 -> return 24
            // Legendary
            //
            odds < 8650 -> return 25
            odds < 8700 -> return 26
            odds < 8750 -> return 27
        }
        return 0
    }

    private fun genFruit() {
        odds = Random.nextInt(0,8800)
        fruitNum = getFruitNum()
        fruitImg = getFruitTxt()
        caliber = getCaliber()
        caliberImg = getCaliberTxt()

        binding.fruit.text = fruitImg
        binding.fruitTwo.text = fruitImg
        binding.cali.text = caliberImg
        binding.caliTwo.text = caliberImg
    }
}