Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lpL7V9u5"
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76258124;
	Thu, 14 Dec 2023 03:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702555096;
	bh=H4glu+KQRzxtv6e+eHc7mU495CXC1LwVvNxxpwKbl44=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lpL7V9u562AAjhB9/7kMqY42xMlBcHExPNKxYRabxpeHTeNwKhav30nl9FFyV+5zx
	 xeydlCjn0OeZRugoBsM+njnzzaQCfiveDzMInmVjeaQySD6tWAv8sc9+B5v0sGK+CT
	 N9qhlJfhtnW0U1zTFDSh/vGsheTnF+ihaSkFFhSZ2H2YO9YHlBHGmvfgy3OvduV+CU
	 jttkLN5R8Q+bEbW8t0Dkz6YP8p4ODQUGxvFHw1W/AvZlBOmF9EhehgX9vMd5gVgBEL
	 WwzQM2z3qFg8xI3ESkYrsYFaj8agiJrDkNPN3F2rF6Vov02dWKpTdSe3ORrecY+Wni
	 Fg1BHTsBa16VA==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 741BA37814A4;
	Thu, 14 Dec 2023 11:58:15 +0000 (UTC)
Message-ID: <c4d4b60a-6cf0-4537-ab51-630ad909c3f0@collabora.com>
Date: Thu, 14 Dec 2023 13:58:14 +0200
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
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
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
 <22ac83a7-287c-46ba-b981-cb810b911e5e@linux.intel.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <22ac83a7-287c-46ba-b981-cb810b911e5e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/14/23 13:51, Péter Ujfalusi wrote:
> 
> 
> On 14/12/2023 12:48, Péter Ujfalusi wrote:
>> @@ -265,7 +276,9 @@ static void sof_print_profile_info(struct snd_sof_dev *sdev,
>>  			 "Using fallback IPC type %d (requested type was %d)\n",
>>  			 profile->ipc_type, ipc_type);
>>  
>> -	dev_info(dev, "Firmware paths/files for ipc type %d:\n", profile->ipc_type);
>> +	/* The firmware path only valid when generic loader is used */
>> +	if (sof_platform_uses_generic_loader(sdev))
>> +		dev_info(dev, "Firmware paths/files for ipc type %d:\n", profile->ipc_type);
>>  
> 
> This is the correct section in here, sorry:
> 
> -	dev_info(dev, " Firmware file:     %s/%s\n", profile->fw_path, profile->fw_name);
> +	/* The firmware path only valid when generic loader is used */
> +	if (sof_platform_uses_generic_loader(sdev))
> +		dev_info(dev, " Firmware file:     %s/%s\n", profile->fw_path, profile->fw_name);
> +
>  	if (profile->fw_lib_path)

No problem, thanks for the update!

