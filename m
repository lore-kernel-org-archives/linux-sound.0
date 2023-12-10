Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="rI/rIOI1"
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F7BEF2;
	Sun, 10 Dec 2023 02:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702203175;
	bh=sEa4BkJsty9NXVf35sfIazyJ3FSPIEWmXYIJDF2tjOU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rI/rIOI1XtuFufgdnUV3Vs7NOpNc4xUeVxJ4Mj3L4D18OL6NXIhgDLLUKLG2hHnAm
	 K4NyAuKI2qK6z6WJXBTulxRE6cVRtiqcZJGAcd1F4Rf2Uvg4lvD+WlRoCXkWN1EVEL
	 kRZ5f3otHgAY2oU1YkrL8CBKws9Kv0pFVMaaBzcZnKPQhfkyf9/QCctclffiCy3VAq
	 wthwb72ewrHQEsD24tjJaf+mNgQ86hMnnk99zJrPtqyse1QK4J7KHGKh14VV0zVDOh
	 qvRxaEvICKf4w6YQ5B6hXgErx8WicpgInEcrHI/ACseGVPtXN4J9tUZYvvsDcuBmN0
	 1mxVXvInA3+VA==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EF627378000B;
	Sun, 10 Dec 2023 10:12:53 +0000 (UTC)
Message-ID: <421128f7-6a17-4be9-a72b-272ea4017fbd@collabora.com>
Date: Sun, 10 Dec 2023 12:12:53 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] ASoC: SOF: topology: Add new DAI type entry for
 SOF_DAI_AMD_BT
Content-Language: en-US
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Marian Postevca <posteuca@mutex.one>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Mastan Katragadda <Mastan.Katragadda@amd.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org, kernel@collabora.com
References: <20231209205351.880797-1-cristian.ciocaltea@collabora.com>
 <20231209205351.880797-12-cristian.ciocaltea@collabora.com>
 <fad8a055-eabb-4087-94d5-9e1de00933e4@amd.com>
 <aa830670-e544-43a2-9ba9-a64f1964a9f5@collabora.com>
 <318470ce-1631-4c46-b425-755c877dda65@amd.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <318470ce-1631-4c46-b425-755c877dda65@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/10/23 11:51, Venkata Prasad Potturu wrote:
> 
> On 12/10/23 14:38, Cristian Ciocaltea wrote:
>> On 12/10/23 05:30, Venkata Prasad Potturu wrote:
>>> On 12/10/23 02:23, Cristian Ciocaltea wrote:
>>>> Commit efb931cdc4b9 ("ASoC: SOF: topology: Add support for AMD ACP
>>>> DAIs") registered "ACP" name for SOF_DAI_AMD_BT DAI type.  However,
>>>> some
>>>> boards, i.e. Steam Deck OLED, seem to require "ACPBT" for the same
>>>> type:
>>>>
>>>> [  467.489680] snd_sof_amd_vangogh 0000:04:00.5: ipc tx error for
>>>> 0x30030000 (msg/reply size: 16/0): -22
>>>> [  467.492775] snd_sof_amd_vangogh 0000:04:00.5: sof_ipc3_route_setup:
>>>> route ACPBT2.IN -> BUF5.0 failed
>>>> [  467.495839] snd_sof_amd_vangogh 0000:04:00.5:
>>>> sof_ipc3_set_up_all_pipelines: route set up failed
>>>> [  467.499128] snd_sof_amd_vangogh 0000:04:00.5: error: tplg component
>>>> load failed -22
>>>> [  467.502210] snd_sof_amd_vangogh 0000:04:00.5: error: failed to load
>>>> DSP topology -22
>>>> [  467.505289] snd_sof_amd_vangogh 0000:04:00.5: ASoC: error at
>>>> snd_soc_component_probe on 0000:04:00.5: -22
>>>> [  467.508430] sof_mach nau8821-max: ASoC: failed to instantiate
>>>> card -22
>>>> [  467.511725] sof_mach nau8821-max: error -EINVAL: Failed to register
>>>> card(sof-nau8821-max)
>>>> [  467.514861] sof_mach: probe of nau8821-max failed with error -22
>>>>
>>>> Add "ACPBT" alias for "ACP" SOF DAI type.
>>>>
>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>> ---
>>>>    sound/soc/sof/topology.c | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
>>>> index e3e7fbe40fa6..73bf791e7520 100644
>>>> --- a/sound/soc/sof/topology.c
>>>> +++ b/sound/soc/sof/topology.c
>>>> @@ -290,6 +290,7 @@ static const struct sof_dai_types sof_dais[] = {
>>>>        {"SAI", SOF_DAI_IMX_SAI},
>>>>        {"ESAI", SOF_DAI_IMX_ESAI},
>>>>        {"ACP", SOF_DAI_AMD_BT},
>>>> +    {"ACPBT", SOF_DAI_AMD_BT},
>>> No need to create the alias name, we can directly modify ACP to ACPBT as
>>> ACP is not using anywhere.
>> Great, thanks, will do in v2.
> This should send to SOF git repo for rewiew, once SOF reviewers approved
> this, again need to send to broonie git.
> All the changes in sound/soc/sof/ path should go to SOF git.

Unfortunately I'm not familiar with the SOF dev workflow. So it's not
enough to have this patch cc-ed to sound-open-firmware@alsa-project.org?

>>>>        {"ACPSP", SOF_DAI_AMD_SP},
>>>>        {"ACPDMIC", SOF_DAI_AMD_DMIC},
>>>>        {"ACPHS", SOF_DAI_AMD_HS},
