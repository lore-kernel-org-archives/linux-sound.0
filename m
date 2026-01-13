Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BB235505B
	for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 22:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768342005; cv=none; b=hzjEGHRMODLypHNJV/EwojgDP2GLxFAJ3gcTvbUTzLHeVTF/2eadki81fPmG5cLGwG3yoNPKkhKAoxaN0e3NMg/0nEwnI4I38nIA8cnTb6WFaC88+D5GjfJ3wTOG6cGp2GgD7bdXiFwf6Fe77wTVEYRghnulzSGuLpegRyvPXjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768342005; c=relaxed/simple;
	bh=vWP5gPQea2tA+PAPwWbrLk6aXCQjYSfBpPupfmtBs2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jXbn2Y8trRpsI/n+UPmXlAEjuCXkHyI7SM0jI0IPYRcHFat81xF9iyyc2rDSO1xzJD/eL4vX14SNgUsRs1gwtXAB2ZkX3huCNwBoHgplQI+EpnQOdPcXCjFXrNFglgt1+t/chyAfnBJ9LN+mcbCMaRDGJ0S5abCtwcWrDJs2NU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ODYnjls5; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ODYnjls5"
Message-ID: <d986d4a8-1686-4020-921e-e484808d029f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768342001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ysGrxMqpspMxgiViX7FS9udKRgIIoA5I/AJUUcBQIFg=;
	b=ODYnjls5j4UP2hV84gKLov66kkT/AInnYxB63m4Zv7XSRYL1dBTeFvhvEup8FxO2A3F+sk
	ZT1VnyytWNth5rAmm3+sPQpoNeOSJsQAymbSpWhBdrWn/+kfyDiyfpUvx/442ZOkVCdkM7
	HQniQEiZxgia4nwd0Nnvq86DaKCCXQ0=
Date: Tue, 13 Jan 2026 22:29:51 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/4] SDCA System Suspend Support
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20260109145206.3456151-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260109145206.3456151-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/9/26 15:52, Charles Keepax wrote:
> Add support for system suspend into the class driver, now split
> out into a separate patch chain.
> 
> Where we got to on the previous discussion, was we don't currently
> have any parts requiring download on runtime resume, doing so
> will add noticeable delay to the runtime resume, and we are not
> blocking someone from adding support for firmware download on
> runtime resume in the future. Also as runtime resume is really
> a kernel concept and power rails are primarily controlled by
> ACPI it is quite unlikely anyone will actually power down the
> part on a runtime suspend anyway. So this version of the chain
> still only downloads firmware on probe and system resume.

LGTM, thanks Charles

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
 
> Changes since v2:
>  - Update some error message capitalisation.
>  - Update some kernel doc.
>  - Add a runtime_get to ensure force resume runs the runtime resume.
>  - Correct detection of system suspend in FDL IRQ.
> 
> Changes since v1:
>  - Update SDCA IRQ enable/disable API to be more clear.
> 
> Charles Keepax (4):
>   ASoC: SDCA: Add SDCA IRQ enable/disable helpers
>   ASoC: SDCA: Add basic system suspend support
>   ASoC: SDCA: Device boot into the system suspend process
>   ASoC: SDCA: Add lock to serialise the Function initialisation
> 
>  include/sound/sdca_interrupts.h      |   7 ++
>  sound/soc/sdca/sdca_class.c          |  34 ++++++++
>  sound/soc/sdca/sdca_class.h          |   2 +
>  sound/soc/sdca/sdca_class_function.c | 126 ++++++++++++++++++++++-----
>  sound/soc/sdca/sdca_interrupts.c     |  93 ++++++++++++++++++--
>  5 files changed, 236 insertions(+), 26 deletions(-)
> 

