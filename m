Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E2aKKEJ+"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A012B2;
	Thu, 14 Dec 2023 03:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702554675; x=1734090675;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=pEHuGf1fkNpt7pS74DDDiu6iHjp4ZmOQbjgqIG66MR4=;
  b=E2aKKEJ+3eEY8Y7MrH9vXcv/Y14o5jE/jsovUXQFdaYqo/CnbVqwxL9H
   mDzCdzMWMcTt9ZU9yEkWyVzar130IizvQOCqm9yIbq42ibQ+zFFINfBtG
   c6n9NwhscGw+d0g2yd2enzWMb2tYZKeJIgUmYD7Zf7Bj9zTVfvJAhqc+M
   PWittbYP2mIKINWfiFwhlHLDmkw1mzsTbeU8mb6GzYhU2dcdgZhuZICHf
   Egau53+nF6PLq+x7PhXmJiyqyKoX1LJCl7FiIaqZAbTZpuetWNn1PiRDQ
   yYFsD3KM3Ba011/mT5VCVg07Ugc5vZ98EFQ0bOa1+8UNbDXJE2ElskyAy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="375263506"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="375263506"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 03:51:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="777874367"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="777874367"
Received: from eborisov-mobl2.ger.corp.intel.com (HELO [10.249.34.72]) ([10.249.34.72])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 03:51:10 -0800
Message-ID: <22ac83a7-287c-46ba-b981-cb810b911e5e@linux.intel.com>
Date: Thu, 14 Dec 2023 13:51:52 +0200
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
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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
In-Reply-To: <6e52c5a2-24d5-422a-9a40-a0053729c98e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 14/12/2023 12:48, Péter Ujfalusi wrote:
> @@ -265,7 +276,9 @@ static void sof_print_profile_info(struct snd_sof_dev *sdev,
>  			 "Using fallback IPC type %d (requested type was %d)\n",
>  			 profile->ipc_type, ipc_type);
>  
> -	dev_info(dev, "Firmware paths/files for ipc type %d:\n", profile->ipc_type);
> +	/* The firmware path only valid when generic loader is used */
> +	if (sof_platform_uses_generic_loader(sdev))
> +		dev_info(dev, "Firmware paths/files for ipc type %d:\n", profile->ipc_type);
>  

This is the correct section in here, sorry:

-	dev_info(dev, " Firmware file:     %s/%s\n", profile->fw_path, profile->fw_name);
+	/* The firmware path only valid when generic loader is used */
+	if (sof_platform_uses_generic_loader(sdev))
+		dev_info(dev, " Firmware file:     %s/%s\n", profile->fw_path, profile->fw_name);
+
 	if (profile->fw_lib_path)


-- 
Péter
