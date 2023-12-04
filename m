Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NR2+Ubjh"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B406B0;
	Mon,  4 Dec 2023 03:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701689642; x=1733225642;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mXvRkmXLfgor2iho/IhL1gImLWrqp5l3U0QromWXKnk=;
  b=NR2+UbjhOy7ywJj81WiAphBd98CmIlLNVcsRwd3tz+vfuZIdRFjzYcH8
   zBpAAkm3680LYRRpEseOKPsDalZMPlSsY5S8FJZYZ8X1nlSGuxQRIZYjv
   +XEhj70qXx360HEo3KK6F9fyYIgGg9BWNrJLgmr/Qrxhsl9/smQt2BI4W
   l9FeFzWGyoCcJwECsfiUfv6od37BkBTMY4MT2z9he1uSm0s7BelYcc14R
   d4O3u9Gwvhpe9ANwrB7AmFeqCs5aEMOA/jav9rVoz88xmKjWs6v7qVf0J
   iG0Ba3Ldid0g3uiz9T7yZT2SeUyN2MEMf6uZgubqCdeXOyNvpafdp02QQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="390878531"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="390878531"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 03:34:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="841007981"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="841007981"
Received: from epologov-mobl2.ccr.corp.intel.com (HELO [10.249.32.181]) ([10.249.32.181])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 03:33:57 -0800
Message-ID: <1e1430fb-d1d6-476d-a2d1-64ce2c86daa6@linux.intel.com>
Date: Mon, 4 Dec 2023 13:34:37 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: Fix null pointer dereference in sof_pci_probe
Content-Language: en-US
To: Kunwu Chan <chentao@kylinos.cn>, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 kai.vehmanen@linux.intel.com, broonie@kernel.org, perex@perex.cz,
 tiwai@suse.com, chao.song@intel.com
Cc: kunwu.chan@hotmail.com, sound-open-firmware@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231123155424.1275919-1-chentao@kylinos.cn>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20231123155424.1275919-1-chentao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 23/11/2023 17:54, Kunwu Chan wrote:
> devm_kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure.
> 
> Fixes: 46207ca24545 ("ASoC: SOF: pci: change the default firmware path when the community key is used")
> Fixes: 25bbc0c59ee1 ("ASoC: SOF: Add path definition for external firmware libraries")
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>

This patch cannot fix both commits as at 46207ca24545 the lib path was
not present.
Please don't bundle unrelated fixes, it makes maintainers life harder.

As a note: if the allocation fails it is not going to cause null
dereference as the code checks !sof_pdata->*_prefix to see if it is
provided (override) or not (use default).
At most it will cause the kernel to 'ignore' the path override, but if
this allocation fails this is least of our problem ;)

> ---
>  sound/soc/sof/sof-pci-dev.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
> index 64b326e3ef85..75a9bfa5bfbe 100644
> --- a/sound/soc/sof/sof-pci-dev.c
> +++ b/sound/soc/sof/sof-pci-dev.c
> @@ -282,6 +282,10 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
>  			devm_kasprintf(dev, GFP_KERNEL, "%s/%s",
>  				       sof_pdata->desc->default_fw_path[sof_pdata->ipc_type],
>  				       "community");
> +		if (!sof_pdata->fw_filename_prefix) {
> +			ret = -ENOMEM;	
> +			goto out;
> +		}
>  
>  		dev_dbg(dev,
>  			"Platform uses community key, changed fw path to %s\n",
> @@ -303,6 +307,10 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
>  				devm_kasprintf(dev, GFP_KERNEL, "%s/%s",
>  					sof_pdata->desc->default_lib_path[sof_pdata->ipc_type],
>  					"community");
> +			if (!sof_pdata->fw_lib_prefix) {
> +				ret = -ENOMEM;
> +				goto out;
> +			}
>  
>  			dev_dbg(dev,
>  				"Platform uses community key, changed fw_lib path to %s\n",

-- 
Péter
