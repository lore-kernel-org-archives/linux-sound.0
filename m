Received: from mta0.migadu.com (out-94.mta0.migadu.com [91.218.175.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71F358597A
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 14:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963792; cv=none; b=jlrGiRKSH0e3HPiihoH2l1gA2OuJ+2ajSzbvOzxX8ZSsAuN3AlpyyWo45FTY7SVkgvsmAIbX+EMEvb424Bk84Ua62gJ+/PY2SWQn3+Bf5hd2kQS0kLITnGtzjC/kShwBI1Dg3L+MTKWX9hpJknZitcqbmWHOYdApJerc0KkcOlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963792; c=relaxed/simple;
	bh=fAedA1C+Z8+/68zJeMEg+aEPz6eLzkZ2jmMMnrlyUXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RLJKkQRUw+pfco/J705YSrR15n61/FOjQSoI5PITT7YiYNN8q2Xezty9+yQKAl6mpZ9i/fu0v229n2Wkd0Mp02fmel+TgdNYSIQAetaY7bhWRdFqw29BG77cUxquAa/YCg+OZ7WtiptVn5bNfUEZ0R9jx91rldzAtW2/U91x/Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WsnUbNRK; arc=none smtp.client-ip=91.218.175.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WsnUbNRK"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fAedA1C+Z8+/68zJeMEg+aEPz6eLzkZ2jmMMnrlyUXw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788963788; v=1; x=1789568588;
 b=WsnUbNRKUQpHA1SbNMgrSWLI44BWV1rqX6ZbMCoOBSQydSKHs8LQz8xR2rS6p0pbe3Oirpjp
 PlXKzlVCRi3PmBQQZGf6D5I64tMqYGgBbwDniO+RJ8e4//hh/8Bbmp7NthwUmLh0g3htezhEWHu
 AFK7c+UcsqskZiH+HFwd0HCs=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 312a6a15bf28f756;
	Wed, 09 Sep 2026 14:23:08 +0000
X-Mizu-Trace-ID: 312a6a15bf28f756
X-Migadu-Flow: FLOW_OUT
Message-ID: <90bf9dc4-757d-4400-a7ba-fad64ef25541@linux.dev>
Date: Wed, 9 Sep 2026 14:49:42 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/24] ASoC: SOF: ipc4: Add definition of module data
 in init_ext object type
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, vkoul@kernel.org,
 perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
 <20260909090949.7503-15-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260909090949.7503-15-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 11:09, Peter Ujfalusi wrote:
> The SOF_IPC4_MOD_INIT_DATA_ID_MODULE_DATA type within the module_init_ext
> area is module specific init data.

Not sure if this is cryptic or hollow...

Maybe reword as "add a new IPC4 module-specific object type to do xyz">
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
> ---
>  include/sound/sof/ipc4/header.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
> index cea3d9453b84..e5161f0a37e8 100644
> --- a/include/sound/sof/ipc4/header.h
> +++ b/include/sound/sof/ipc4/header.h
> @@ -706,7 +706,8 @@ struct sof_ipc4_module_init_ext_object {
>  enum sof_ipc4_mod_init_ext_obj_id {
>  	SOF_IPC4_MOD_INIT_DATA_ID_INVALID = 0,
>  	SOF_IPC4_MOD_INIT_DATA_ID_DP_DATA,
> -	SOF_IPC4_MOD_INIT_DATA_ID_MAX = SOF_IPC4_MOD_INIT_DATA_ID_DP_DATA,
> +	SOF_IPC4_MOD_INIT_DATA_ID_MODULE_DATA,
> +	SOF_IPC4_MOD_INIT_DATA_ID_MAX = SOF_IPC4_MOD_INIT_DATA_ID_MODULE_DATA,
>  };
>  
>  /* DP module memory configuration data object for object array */

