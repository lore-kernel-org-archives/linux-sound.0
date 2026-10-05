Received: from mta0.migadu.com (out-16.mta0.migadu.com [91.218.175.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608A64D0A1F
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 18:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791225395; cv=none; b=TyFhNEjK2k9NiZlLrxCmrT+oVsyCHmyEeUbmpD2s1koZOnBRD5tT/+KWvB7Fb5iHZ60CTyLibXpnyoAYEnLy7umm5K+RzF/jQz7j8NHcjyPbCxYHGIwySBhvBqdxMmeOJ4LaonQaP3BGt/3fwONLVNnbzmoYT2+GhH6fs1ZioPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791225395; c=relaxed/simple;
	bh=VH3fazZVbUfSLVY2e2i0tAxrAEC+qES7skZoK/+b84k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XsIphpse+1J6Lkbo3uA1FVV10BNlwoYyTr9Vm8+TYPMqK73AhcezZMahQ4cgqDgY9c+AXomvToH0/VWQ5r9/BrqRDw7bYwsEMtfyerY1b7HMqXJt4ZXGxvsuS7Xtq/PAN8thQ5K7fC4juEHZTYOkQ5UM/P7jZwOVoRA3sUgNCI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jkkKxKMe; arc=none smtp.client-ip=91.218.175.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jkkKxKMe"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VH3fazZVbUfSLVY2e2i0tAxrAEC+qES7skZoK/+b84k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791225391; v=1; x=1791830191;
 b=jkkKxKMezucoTrL6FPeNn1i7vcMkXOrlc1BT/O+rBcINI289eEIWPKkrKf9CdK3al0kqpGVB
 yPpLvViFWp2jSh+rpMuX7ts4ibhbHK0mRaw4Uar8GbffTOTHAYK+/gGFv8hkY0kw8QRTt+HcliL
 CkvP5oyGf16fiWCY90zpit7k=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3aff7846d64c2939;
	Mon, 05 Oct 2026 18:36:31 +0000
X-Mizu-Trace-ID: 3aff7846d64c2939
X-Migadu-Flow: FLOW_OUT
Message-ID: <32e25f8c-9c96-4385-9f5f-a7cf8b11ef57@linux.dev>
Date: Mon, 5 Oct 2026 20:33:12 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ASoC: cs35l56/57/62/63: Use the correct SoundWire DP
 for feedback
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20261005155235.1386525-1-rf@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261005155235.1386525-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/5/26 17:52, Richard Fitzgerald wrote:
> The amp feedback path (AEC) was incorrectly using SoundWire DP3.
> The firmware outputs SDCA OT25 feedback on DP4. DP3 is reserved for
> SDCA companion amp.
> 
> This series adds a DAI for OT25 and switches the sdw machine driver
> to use the new DAI for the feedback path.

Is there any merit in keeping this DP3 exposed as a capture DAI, if
indeed it's intended to be a side connection for a companion chip?

I never quite understood how those companion chips would be managed,
IIRC we don't have support for device-to-device transfers, do we? the
entire stream definition and bandwidth calculation are based on a host
port as source or target.

> Richard Fitzgerald (2):
>   ASoC: cs35l56: Add DAI for SDCA OT25 stream
>   ASoC: sdw_utils: Switch CS35L56/57/62/63 to use OT25 DAI
> 
>  include/sound/cs35l56.h             |  1 +
>  sound/soc/codecs/cs35l56-sdw.c      |  9 +++--
>  sound/soc/codecs/cs35l56.c          | 54 +++++++++++++++++++++++++++++
>  sound/soc/sdw_utils/soc_sdw_utils.c |  8 ++---
>  4 files changed, 66 insertions(+), 6 deletions(-)
> 

