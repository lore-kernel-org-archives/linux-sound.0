Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ThA5fj7C"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95841BD;
	Thu, 14 Dec 2023 03:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702553723; x=1734089723;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=86BKh1Ji8KJODootQFM153eX5Rr38NiTHUsKdo5u/jw=;
  b=ThA5fj7C4fRasZz5WKRFS92N/tMwfThtlPuauovnpqA8xjXrEOcUOgRv
   TDkC2hbM+li6ZvnDPCjKYUYH++N3N/oRpJO4ubAD8BI1/sJ7VCeb012qR
   jXtf8xIqmq6Pzr68NSdhEmmILF/tEfKiptJCc/8oY/rEoXXhsCDPKscUm
   vwBylMoCNspe3jNMdmcj8OvpyWBWtiiV8YqCdR7NsVPV2f/p4UKzYoqUj
   01BoYmWLIkVatX27oLCLDSylaB8t+EmQJxN//XfeA+ko3pdNXg98gLO0O
   Jmw6XrVsx2hb6WF/HGdG7tpxhnDNclSsQ3w87XmQmuOhSn6J6bzlQdGNk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="375262320"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="375262320"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 03:35:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1105674824"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="1105674824"
Received: from eborisov-mobl2.ger.corp.intel.com (HELO [10.249.34.72]) ([10.249.34.72])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 03:35:16 -0800
Message-ID: <40d92933-c9f0-472f-b5dc-f95b087cdb3e@linux.intel.com>
Date: Thu, 14 Dec 2023 13:35:58 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] ASoC: SOF: core: Skip firmware test for undefined
 fw_name
Content-Language: en-US
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
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
 <20231209205351.880797-8-cristian.ciocaltea@collabora.com>
 <6e52c5a2-24d5-422a-9a40-a0053729c98e@linux.intel.com>
 <81af6357-8338-4768-a180-305516ac89e3@collabora.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <81af6357-8338-4768-a180-305516ac89e3@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 14/12/2023 13:29, Cristian Ciocaltea wrote:
>> diff --git a/sound/soc/sof/fw-file-profile.c b/sound/soc/sof/fw-file-profile.c
>> index 138a1ca2c4a8..7b91c9551ada 100644
>> --- a/sound/soc/sof/fw-file-profile.c
>> +++ b/sound/soc/sof/fw-file-profile.c
>> @@ -89,6 +89,15 @@ static int sof_test_topology_file(struct device *dev,
>>  	return ret;
>>  }
>>  
>> +static bool sof_platform_uses_generic_loader(struct snd_sof_dev *sdev)
>> +{
>> +	if (sdev->pdata->desc->ops->load_firmware == snd_sof_load_firmware_raw ||
>> +	    sdev->pdata->desc->ops->load_firmware == snd_sof_load_firmware_memcpy)
>> +		return true;
>> +
>> +	return false;
>> +}
> 
> I would drop the conditional and simply return.

What do you mean? We need to check if the platform is using either type
of the generic load_firmware helper (the _memcpy is calling the _raw to
load the file).

-- 
Péter
