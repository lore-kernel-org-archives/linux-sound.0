Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B648A33F3
	for <linux-sound@vger.kernel.org>; Wed,  6 Nov 2024 02:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=137.74.80.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730861013; cv=none; b=aMuFWOpSJFquQEomRlAVjrg6Oa/Qxrh9p6uFNyKZtakINjR+6w+HHGzUgyUfq8yS0xDsXwU8QbIhFlpqyzo8rn332uPAVSrn4GWO/QTDHR+hPyMjEgseculfUQKwE+TIbzHtaUn9Qbgn1dkhi2PB8NvP/9+lNubbMykpoaLfyOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730861013; c=relaxed/simple;
	bh=l29/Yf98WKz4qYQ88Ubs6cQUYviOEeqF+BBcdJm2rY4=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=nZwN3jHlIYF3KD1xQlEdRFQPjeCLzNoXQX9Cm1v1cTnPQuHDX2YFzMz41B29R6KcUo6e493VryAnWoWxkUOegtTjRId2ETehfMHWTfMdrvq3aGBTcocvBaILSPRZ6k87VWcBpNhaIKKU6JISpQRtmzpVtx1hSP32Th+GwEsG/hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=AvDQdufz; arc=none smtp.client-ip=137.74.80.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="AvDQdufz"
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id ED4822031C;
	Wed,  6 Nov 2024 02:43:29 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id DF5C5400F7;
	Wed,  6 Nov 2024 02:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1730861007; bh=l29/Yf98WKz4qYQ88Ubs6cQUYviOEeqF+BBcdJm2rY4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AvDQdufz2QBsqLU0OPBSvoXQ/CqldFywCKbVEgm/+5Jf8q5eeePJQc3njUkwAu1Km
	 5Lq5l4L4ubMlgNJJekkNyi2CqZJ7ZZ5Is5UwSnra9/PMKX0jh07ggknk65uIrS6FJ4
	 maatXS9YWWMqLlShDCamLrzcZy/3KUCWuTONwRjs=
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 442CD41344;
	Wed,  6 Nov 2024 02:43:27 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 06 Nov 2024 10:43:26 +0800
From: Mingcong Bai <jeffbai@aosc.io>
To: Mark Brown <broonie@kernel.org>
Cc: mario.limonciello@amd.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: amd: yc: fix internal mic on Xiaomi Book Pro 14
 2022
In-Reply-To: <d8234639-0082-474f-94e9-3b7714c13073@sirena.org.uk>
References: <8bad41b7ddbc8e061f682ecdf00a50e1@aosc.io>
 <d8234639-0082-474f-94e9-3b7714c13073@sirena.org.uk>
Message-ID: <5c23472160eed3c9a10a7f37ebb82b35@aosc.io>
X-Sender: jeffbai@aosc.io
Organization: Anthon Open Source Community
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DF5C5400F7
X-Rspamd-Server: nf2.mymailcheap.com
X-Spamd-Result: default: False [-0.10 / 10.00];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3]
X-Rspamd-Action: no action

Hi Mark,

在 2024-11-06 03:11，Mark Brown 写道：
> On Fri, Nov 01, 2024 at 12:35:35PM +0800, Mingcong Bai wrote:
>> Xiaomi Book Pro 14 2022 (MIA2210-AD) requires a quirk entry for its
>> internal microphone to be enabled.
> 
> This doesn't apply against current code, please check and resend.
> 
> Applying: ASoC: amd: yc: fix internal mic on Xiaomi Book Pro 14 2022
> error: git diff header lacks filename information when removing 1 
> leading pathname component (line 6)
> error: could not build fake ancestor
> Patch failed at 0001 ASoC: amd: yc: fix internal mic on Xiaomi Book Pro 
> 14 2022

Patch rebased against latest master with minor revisions to message 
format (I forgot to run checkpatch.pl last time). I have just re-sent 
the patch as v2. Thanks!

Best Regards,
Mingcong Bai
