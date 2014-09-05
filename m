From: Anatol Pomozov <anatol.pomozov@gmail.com>
Date: Fri, 05 Sep 2014 23:02:53 +0000
Subject: A few questions about soc/alsa
Message-Id: <CAOMFOmXe7rcvZfp+n+CWDEQUwU=wRWJCZytWRCCBLOfJ4xKv3A@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi

I just started working on soc audio for one board and trying to learn
more about soc/alsa implementation details (kernel 3.14).

My board uses Realtek 5677 driver (is it upstream since 3.14). SOC
connects to codec via I2S1 bus. Codec connects to speaker amplifier
(Analog Devices SM4567) via I2S2.

[SOC] <= I2S1 => [Realtek RT5677] <= I2S2 => [Speaker Amp SM4567]

Now I am trying to add the board driver fooboard_rt5677.c and my first
question is how DAI links the board driver should describe?


static struct snd_soc_dai_link fooboard_rt5677_dai[] = {
{
.name = "RT5677",
.stream_name = "RT5677 PCM",
.codec_dai_name = "rt5677-aif1",
.init = fooboard_rt5677_asoc_init,
.ops = &fooboard_rt5677_ops,
.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS,
}
}


Should I add I2S2 interface to snd_soc_dai_link array? What this array
after all? Does it describe *all* digital interfaces or only those
that are connected to the CPU?

If latter then I2S2 should not be in this array. But in this case who
should configure I2S2 bus and when? Does it happen when audio route
AIF1=>RT5677=>AIF2 becomes active? Could anyone point to the code
where such activation happens? Are there any existing soc examples
with configuration like in my case (i2s2 bus is for a speaker amp)?





Are there any good sources of information about alsa/soc besides
Documentation/sound/alsa/soc? Any books/articles that might be useful
for a rookie?
