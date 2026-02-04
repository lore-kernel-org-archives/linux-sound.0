Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46639244694
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 13:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770212978; cv=none; b=hm8T9cj1PkiF62ryb5OWawTP8RrdXAREvuUoiq665vt24WFwplk+RIGqas9UyPUXzI8ThTdjxHZpNxbKY59GQwt4NXdIqB1Knq0pDJwUt1Df+y0vHbUx00jMIlv2t52R1WOdYnhAl4FE1p2ZBJverhKdK/vWLrK9R1/4MRe8vfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770212978; c=relaxed/simple;
	bh=5rMvUGdKeN518PqUB9sJtRH/LTcSa2Ge66KNp4dawAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WH/Q64xtWDx+/oEL0tv5FJJXk7H0QZjI1Yj3SpF8609gebQVRfDf6gmM4hFer0EwYyaw23jxJMmjqzsmhefXVeR+sASvYt6D/nc2BZqI47zM73QAkpOgknA1vDJK85bB7GFmNbNe1FXe7wTjB0DWXTSzhBxDn9LOoHQYtmZk4q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RINroZr3; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RINroZr3"
Message-ID: <75af4057-c015-4bd0-bd23-f719868410c2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770212975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Tm4Hd4tcgUiSqbmmM5JdcJhHgVh9Yn+EvBW1Ac6mfY=;
	b=RINroZr3zjkJusl9afp4mzINO0eS8woGLjsiDx1Ddcf2RP5pQxrXFCpAbI1TZyMO1Cykin
	pGykyEOeGaoCMTdNfSTCz3KIq2xwSsgXd8hP/sH6+NdUv0fKyB0DZB1ZTT6T66yTsqEBp1
	CTy+qbD4ZP6C2GmvqY1qmIKfD1cgC3o=
Date: Wed, 4 Feb 2026 14:30:18 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 3/6] ASoC: sdw_utils: add soc_sdw_es9356
To: Zhang Yi <zhangyi@everest-semi.com>, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
References: <20260204094452.33289-1-zhangyi@everest-semi.com>
 <20260204094452.33289-4-zhangyi@everest-semi.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260204094452.33289-4-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2/4/26 10:44, Zhang Yi wrote:
> Add a utility program for handling ES9356 in the universal machine driver
> 
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> ---
>  sound/soc/sdw_utils/Makefile         |   1 +
>  sound/soc/sdw_utils/soc_sdw_es9356.c | 275 +++++++++++++++++++++++++++
>  2 files changed, 276 insertions(+)
>  create mode 100644 sound/soc/sdw_utils/soc_sdw_es9356.c
> 
> diff --git a/sound/soc/sdw_utils/Makefile b/sound/soc/sdw_utils/Makefile
> index e8bd5ffb1..3818aa2dd 100644
> --- a/sound/soc/sdw_utils/Makefile
> +++ b/sound/soc/sdw_utils/Makefile
> @@ -6,6 +6,7 @@ snd-soc-sdw-utils-y := soc_sdw_utils.o soc_sdw_dmic.o soc_sdw_rt_dmic.o \
>  		       soc_sdw_bridge_cs35l56.o 			\
>  		       soc_sdw_cs42l42.o soc_sdw_cs42l43.o 		\
>  		       soc_sdw_cs42l45.o				\
> +		       soc_sdw_es9356.o				\
>  		       soc_sdw_cs_amp.o					\

Nit-pick: probably best to avoid adding ES support in the middle of CS stuff.

>  		       soc_sdw_maxim.o \
>  		       soc_sdw_ti_amp.o\
