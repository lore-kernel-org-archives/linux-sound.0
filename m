From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Fri, 01 Jul 2022 16:42:27 +0000
Subject: Re: Sound not working after commit bbf7d3b1c4f40eb02dd1dffb500ba00b0bff0303 on Amlogic A311D device
Message-Id: <c4d32547-5f99-595e-21d3-fdb22a1af237@linux.intel.com>
List-Id: <linux-sound.vger.kernel.org>
References: <CADs9LoPZH_D+eJ9qjTxSLE5jGyhKsjMN7g2NighZ16biVxsyKw@mail.gmail.com>
 <15259e38-eccf-d294-a330-a48b5bbbdedf@linux.intel.com>
 <CADs9LoN-L0X1Dr1sP2K7xrcWm7dpHW6MhF47c2eBB0moLNnPRQ@mail.gmail.com>
 <18d3e724-e43f-c166-e322-26cc5e3890b7@linux.intel.com>
 <CADs9LoOZjK=cUuNSEELtgxYoA+yHVFKM_Y9YLcY74smqx8XsjQ@mail.gmail.com>
 <c554b69c-0c73-158d-85d8-95a0375babeb@linux.intel.com>
 <CADs9LoOOOXVC0p8R=b1y+Kfb1+ESEyMaVe9eoW=F5gdp0_GitQ@mail.gmail.com>
In-Reply-To: <CADs9LoOOOXVC0p8R=b1y+Kfb1+ESEyMaVe9eoW=F5gdp0_GitQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Natalsson <harmoniesworlds@gmail.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, ALSA Development Mailing List <alsa-devel@alsa-project.org>



On 7/1/22 10:47, Alex Natalsson wrote:
>> Wow. So there's already a problem with a config and we made it worse...
>>
>> Can you try with this hack attached, just to see what causes the kernel
>> oops?  Thanks!
> 
> Hello friends)
> I modified your hack a little. And I don't understanding what is fe
> and be, but I see what problem apearing due to be_substream points to
> 0.
> The
> "if (!fe_substream->pcm->nonatomic && be_substream->pcm->nonatomic) {"
> at result gives the error...
> 
> * I am sorry what delete recipients in the previous send((

Interesting, thanks for the test results!

[  108.090732] dpcm_be_connect: start

[  108.090734] dpcm_be_connect: 1

[  108.090735] dpcm_be_connect: 3

[  108.090737] dpcm_be_connect: 3.1

[  108.090738] dpcm_be_connect: 3.1 fe_substream_addr8378368

[  108.090740] dpcm_be_connect: 3.1 be_substream_addr=0

[  108.090750] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000000

Indeed it looks like we are de-referencing a NULL pointer, be_substream
isn't initialized.

we could add a simple error check as in the diff below but I don't know
what the root cause might be

	
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c

index a827cc3c158a..093b98b0e394 100644

--- a/sound/soc/soc-pcm.c

+++ b/sound/soc/soc-pcm.c

@@ -1203,6 +1203,15 @@ static int dpcm_be_connect(struct
snd_soc_pcm_runtime *fe,

        fe_substream = snd_soc_dpcm_get_substream(fe, stream);

        be_substream = snd_soc_dpcm_get_substream(be, stream);



+       if (!fe_substream) {

+               dev_err(fe->dev, "%s: fe_substream not initialized\n",
__func__);

+               return -EINVAL;

+       }

+       if (!be_substream) {

+               dev_err(be->dev, "%s: be_substream not initialized\n",
__func__);

+               return -EINVAL;

+       }

+

        if (!fe_substream->pcm->nonatomic && be_substream->pcm->nonatomic) {

                dev_err(be->dev, "%s: FE is atomic but BE is nonatomic,
invalid configuration\n",

                        __func__);
