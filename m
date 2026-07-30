Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B3A3F12C6
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 09:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403364; cv=none; b=XVszsc91HHq4eN+dJWPQ+R22lsPutGRA4JW4AUvJq/cs/liTfG8x/jfWV6KfQXb/hAGrppME9AwFAp5Xb6yQD23Iuy8L9D2Qwa4cXIVrRvPGv6cL7Vyf7DLVpSsvtn8D7/8bDMdS9HEvlB87b+qD64iz62L7Sr8l5TTr8W61WUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403364; c=relaxed/simple;
	bh=/pFADM6vTOgG2vjSajT27rdLPdcVSfNivwa8SJgByFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PKVAB1skkJW/I0P79w5TB71EzMUCNCsLnAFJB490ABqXebAfuVNCBdZ33vnLF6o8M6X/66sdHLppgiAxsBzMGMRnrYbAjghiw69cdAhxiommkVEHDcgawF66UCWEgV22b0Hs+/PV7rpR3wn/KxmPnMDpH7EZ+f6Mss+tGnafumc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=g3eJkPZT; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="g3eJkPZT"
Message-ID: <73c4ffc5-e048-4561-904d-2919327398ef@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785403350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=arQefs/54eBmnX6amjyBHK0fCWsFHAAoHT86CWuM9T4=;
	b=g3eJkPZTAlfBjdzy33egcTRel6ovn47jfCYFZSOKgpZsqb7F0q5se0T2/MncGOoW9Iw9mk
	Sj6r/KWMSLNac1t9D+V+0IJsonnUkrNG6iEPvrueZyQXo1UkAtb1msyBDd5DhWBgHx2JFa
	x6zVGoYPRpPf7/m0VxK5ydE40/3VADQ=
Date: Thu, 30 Jul 2026 11:12:49 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC/soundwire: Intel: reset the PCMSyCM registers in
 hda_sdw_bpt_close
To: Bard Liao <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org,
 broonie@kernel.org, tiwai@suse.de, vkoul@kernel.org
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
References: <20260730012518.2180906-1-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260730012518.2180906-1-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 7/30/26 03:25, Bard Liao wrote:
> Resetting the PCMSyCM registers is required for Intel SoundWire stream. The
> same procedure is done in sdw_hda_dai_hw_params() for the normal

it's actually in sdw_hda_dai_hw_free() for the regular cases, the
sequence is also used in hw_params() but for corner cases such as
xruns/drops, see comment:

/*
	 * reset the PCMSyCM registers to handle a prepare callback when the
PCM is restarted
	 * due to xruns or after a call to snd_pcm_drain/drop()
	 */

No need to respin the patch for this nit-pick.

> SoundWire stream, too.
> 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>

LGTM, this patch makes the _close() sequence and api mimic the _open() one.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>


