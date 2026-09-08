Received: from mta1.migadu.com (out-61.mta1.migadu.com [95.215.58.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9F653446A
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 12:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788870515; cv=none; b=lV2Fe/RT/jW/6QJk8eu4qF8q2VPlVvTgMPhjNWtMv1tEC+NakgSIWZodWLNuLu3N7/3rtLclVydSi+aq1aBJEUMvs0jr4I0DsL9W24WY5vg2qb26lGj5R4bJO6uK0Znog0Qfk46+rbJWXS87nqEZzdWw6JIVm1QmJzzKmXqyu7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788870515; c=relaxed/simple;
	bh=Uv/PXa+MDku7/9oBpNfN+fVbfFFOrYiRSA90I1Z8Gko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hh7V5fnbuWpH7f57wVGdSA2oci2xgZ7tT41P9vtszxmQbY/OKwEDGXpiHWuzJ2kDIZjdUgN+GCxT0H4DxryLQcMaI8ohew03XL9wSp6WzlsjV8RyBoJhgOrwAGLPmbBVzEZmLVqAbnCcLS8F+QBqE3UpfBkQNPRAMiezxjl8kMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XaiZ2J7A; arc=none smtp.client-ip=95.215.58.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XaiZ2J7A"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Uv/PXa+MDku7/9oBpNfN+fVbfFFOrYiRSA90I1Z8Gko=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788870511; v=1; x=1789475311;
 b=XaiZ2J7AcP7U8h0Rd1cXmEmjeEg7sGLx4yOFqzZcLecqX1FUwQzQ874+SwUiFiKKQYbY5Qo9
 g7UUB3nMPq2cgCIX+4mM28UKFmP7Z3od1yv8/hPk6MZmfu9b5XO6jgY5HjEsD1NmJII3X1j9PLS
 E172hBzpLueyInBORZ7+QPgg=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7e31cb0a1015378d;
	Tue, 08 Sep 2026 12:28:31 +0000
X-Mizu-Trace-ID: 7e31cb0a1015378d
X-Migadu-Flow: FLOW_OUT
Message-ID: <d7dccf9b-1729-4679-b20c-29fe4988d4c6@linux.dev>
Date: Tue, 8 Sep 2026 14:06:26 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/23] ASoC: soc-compress: Implement trigger FE-BE
 sequencing as with normal PCMs
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, perex@perex.cz, tiwai@suse.com,
 lgirdwood@gmail.com, srinivas.kandagatla@oss.qualcomm.com,
 linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com,
 Vijendar.Mukunda@amd.com
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
 <20260904073134.29648-5-peter.ujfalusi@linux.intel.com>
 <apsf1kjaFG71NpPd@sirena.co.uk>
 <b64906b9-032f-4435-a179-b663f0202796@linux.intel.com>
 <361eb4b4-d880-4560-8b71-eeda6f28b43c@linux.dev>
 <5b9a199e-abac-4193-94c0-d395329207ed@linux.intel.com>
 <ap7sF6dOY0Pl0c46@parshuram> <69650a4d-3021-49b0-b853-f7b9ba81aae1@linux.dev>
 <7af0b170-dd4a-4aef-b4d8-7e87d72d11f0@linux.intel.com>
 <ap-yDQotxJpw_jHr@parshuram>
 <003c3998-5b46-4532-9d48-dd47b98d544e@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <003c3998-5b46-4532-9d48-dd47b98d544e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> gapless looks to be straight forward fort he first look. What made me
> delay the implementation was the fact that I could not find any way in
> firmware to support the metadata as one - OK, I can just ignore it.
> second: in kernel and in firmware I could not figure out _where_
> actually is the end of the current file in the buffer. In kernel we have
> circular buffer for the DMA and userspace just fills it and since for
> the kernel it is just data, it looks continuous.

I don't think the kernel needs to worry about anything. When the next
track is handled, the data is just added after the current write pointer.

IIRC all the accounting needs to be done at the firmware level, where
you have to reconstruct where the next track starts based on the number
of bytes transferred.
