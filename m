Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="5fKpWA9l"
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F21FD101;
	Sun, 10 Dec 2023 02:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702204357;
	bh=ntPKH8fXnlQDW6fmLSdVDIatJhgzlPI024QuGRVz70Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=5fKpWA9l7nDKlKkxrgZtJXhtkFTe3i/khwDwyohsoHBJ3iUDhE1tpwGW5dwkaIRLV
	 EoGEMNKq/JT6Aj96eaICoWsOPmeBP+TaqSeeWaBOm15cNfNf32CRbrLV56T/XyELd8
	 6/ocI8NJpZJXCR6yjZv2WHdZ7cT/s0k9xa+K8p7hfD/OOwuKNotGFGCyfdkapZ8v0S
	 zAECN4yoIrQBhEjue5SE/V3VZqQSSv8PkWCt9ObOyT3zD9xkYCMf4kC4ovAF3cT9l6
	 NAjFpQ618VTbTWKZ1yNLYnXSmdcM3Ihk8YY8QcQbsuPA9GsEKM7qLxyXeb6zqduO5/
	 GFstCPA3XveOA==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EFC76378000B;
	Sun, 10 Dec 2023 10:32:35 +0000 (UTC)
Message-ID: <41e63870-ab22-45d8-b8b0-c406dbcb07f0@collabora.com>
Date: Sun, 10 Dec 2023 12:32:35 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] ASoC: amd: acp: Use correct DAI link ID for BT
 codec
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
 <20231209205351.880797-11-cristian.ciocaltea@collabora.com>
 <8a218987-965b-4228-b1d1-f7c061d553ab@amd.com>
 <391d2476-8f4a-4670-a248-8d4d9c46ee09@collabora.com>
 <1de9b77a-5737-40e0-ba3b-79c8713be93e@amd.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <1de9b77a-5737-40e0-ba3b-79c8713be93e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/10/23 12:05, Venkata Prasad Potturu wrote:
> 
> On 12/10/23 14:36, Cristian Ciocaltea wrote:
>> On 12/10/23 05:24, Venkata Prasad Potturu wrote:
>>> On 12/10/23 02:23, Cristian Ciocaltea wrote:
>>>> Commit 671dd2ffbd8b ("ASoC: amd: acp: Add new cpu dai and dailink
>>>> creation for I2S BT instance") added I2S BT support in ACP common
>>>> machine driver, but using a wrong BT_BE_ID, i.e. 3 instead of 2:
>>>>
>>>> [ 7.799659] snd_sof_amd_vangogh 0000:04:00.5: Firmware info: version
>>>> 0:0:0-7863d
>>>> [ 7.803906] snd_sof_amd_vangogh 0000:04:00.5: Firmware: ABI 3:26:0
>>>> Kernel ABI 3:23:0
>>>> [ 7.872873] snd_sof_amd_vangogh 0000:04:00.5: Topology: ABI 3:26:0
>>>> Kernel ABI 3:23:0
>>>> [ 8.508218] sof_mach nau8821-max: ASoC: physical link acp-bt-codec (id
>>>> 2) not exist
>>>> [ 8.513468] sof_mach nau8821-max: ASoC: topology: could not load
>>>> header: -22
>>>> [ 8.518853] snd_sof_amd_vangogh 0000:04:00.5: error: tplg component
>>>> load failed -22
>>>> [ 8.524049] snd_sof_amd_vangogh 0000:04:00.5: error: failed to load
>>>> DSP topology -22
>>>> [ 8.529230] snd_sof_amd_vangogh 0000:04:00.5: ASoC: error at
>>>> snd_soc_component_probe on 0000:04:00.5: -22
>>>> [ 8.534465] sof_mach nau8821-max: ASoC: failed to instantiate card -22
>>>> [ 8.539820] sof_mach nau8821-max: error -EINVAL: Failed to register
>>>> card(sof-nau8821-max)
>>>> [ 8.545022] sof_mach: probe of nau8821-max failed with error -22
>>>>
>>>> Move BT_BE_ID to the correct position in the enum.
>>>>
>>>> Fixes: 671dd2ffbd8b ("ASoC: amd: acp: Add new cpu dai and dailink
>>>> creation for I2S BT instance")
>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>> ---
>>>>    sound/soc/amd/acp/acp-mach.h | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/sound/soc/amd/acp/acp-mach.h
>>>> b/sound/soc/amd/acp/acp-mach.h
>>>> index a48546d8d407..0c18ccd29305 100644
>>>> --- a/sound/soc/amd/acp/acp-mach.h
>>>> +++ b/sound/soc/amd/acp/acp-mach.h
>>>> @@ -27,8 +27,8 @@
>>>>    enum be_id {
>>>>        HEADSET_BE_ID = 0,
>>>>        AMP_BE_ID,
>>>> -    DMIC_BE_ID,
>>>>        BT_BE_ID,
>>>> +    DMIC_BE_ID,
>>> This will break the other platforms as this same enum used in topology
>>> to create dailink.
>> If I understand this correctly, there is no consistency across firmware
>> regarding the IDs used for DAI link identification.  What would be the
>> suggested solution in this case?
> 
> These id values should be same in machine driver and topology file, then
> only dailink can create without an error.

Yes, my point was that some topology files seem to require different IDs
for the same DAI link types.  In this case the topology expects ID 2 for
BT, but other topologies would interpret that as DMIC.

> Always new be_id should add at the end only.
> 
> In this case BT_BE_ID should be at the end.
> 
>   enum be_id {
>       HEADSET_BE_ID = 0,
>       AMP_BE_ID,
>       DMIC_BE_ID,
>       BT_BE_ID,
>   }

So you are basically stating the firmware is broken and needs an update
to use ID 3 for BT, and there is nothing we can do about it on driver's
side.  Is that correct?

> 
> 
>>
>> Thanks,
>> Cristian
>>
>>>>    };
>>>>      enum cpu_endpoints {
