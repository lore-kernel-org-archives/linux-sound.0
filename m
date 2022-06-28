From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Tue, 28 Jun 2022 22:47:34 +0000
Subject: Re: Sound not working after commit bbf7d3b1c4f40eb02dd1dffb500ba00b0bff0303 on Amlogic A311D device
Message-Id: <18d3e724-e43f-c166-e322-26cc5e3890b7@linux.intel.com>
List-Id: <linux-sound.vger.kernel.org>
References: <CADs9LoPZH_D+eJ9qjTxSLE5jGyhKsjMN7g2NighZ16biVxsyKw@mail.gmail.com>
 <15259e38-eccf-d294-a330-a48b5bbbdedf@linux.intel.com>
 <CADs9LoN-L0X1Dr1sP2K7xrcWm7dpHW6MhF47c2eBB0moLNnPRQ@mail.gmail.com>
In-Reply-To: <CADs9LoN-L0X1Dr1sP2K7xrcWm7dpHW6MhF47c2eBB0moLNnPRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Natalsson <harmoniesworlds@gmail.com>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>



On 6/28/22 17:10, Alex Natalsson wrote:
>> Any chance you could try with an updated kernel? It's not clear to me if
>> this is a real issue or just a warning that's been fixed since by commit.
> 
> I luanching 5.19-rc2 and finding this problem. Then I used git bisect
> and found this commit, which broke my audio system. I don't know maybe
> I have wrong settings, but for me this real problem because sound not
> working....
> 
>> You may also want to open a bugzilla issue
> Yes, I can. If problem not in my config settings.

It's great that you've been able to bisect.

What's surprising is that you have a long list of errors reported before
the kernel oops, e.g.

[  243.188688]  fe.dai-link-1: ASoC: no backend DAIs enabled for
fe.dai-link-1

[  243.188702]  fe.dai-link-1: ASoC: dpcm_fe_dai_prepare() failed (-22)

[  243.188919]  fe.dai-link-1: ASoC: no backend DAIs enabled for
fe.dai-link-1

[  243.188922]  fe.dai-link-1: ASoC: dpcm_fe_dai_prepare() failed (-22)

Did those appear with this commit? That's usually a sign of missing
mixer settings to connect FE and BE, not sure how this would appear
because of change in the locking.

It would also help if you could add dev_err logs in dpcm_be_connect() to
see in which code section the oops occurs. In theory we have all kinds
of checks before calling dpcm_be_connect() but we've obviously missing
something.
