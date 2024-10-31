Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4C613A865
	for <linux-sound@vger.kernel.org>; Thu, 31 Oct 2024 18:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730400787; cv=none; b=DL0NQcZmrVqq4Ea8GqsiAE+l24VHJifYYDuP2AGHvDcMFAbmVOUZOA26hPoEto32KKGC5S7y9mWN6CNsV447C8/ud8yjlEBwqkc95BGxbwFQnpuKISBywbs2Ix1+ZtJQ2imC3HnBV9+qFO4XsXToTTXZ8Ina9YcGkYyJMnNii/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730400787; c=relaxed/simple;
	bh=QJSsicDwJKIBS1g3FAn/gDcI2s1MVg9sVZNUYVlbrmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aK9x3vrw5wJr/leOj/xq+24apmZFqy+nfcD6M+HOBeuWkdDdq4fu7mvOh0pl0X6sbqFhUc4HjUYev47rUYWNBGUaVCJ3d79tIDSOjLKrpSqsLPrqLlg7oJctiPJd/GCxbSyyT7DOApMXaZ8/fqZbczSfJNJ9JZlAbAyOWZtlax0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=n2FWjUYQ; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="n2FWjUYQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=QJSsicDwJKIBS1g3FAn/gDcI2s1MVg9sVZNUYVlbrmM=; t=1730400784;
	x=1730832784; b=n2FWjUYQT+UIuuET8elxb5A+qmMP8iWwDfW2lENFvUDp/7pNizUqwQSX9+2Rx
	xM3hY8ragrHyM8MbZB+n7mJiCn7WKXRgh+gFSYD4UeCrVfvjZEL2Eddmm/p1UE/xTjUzJxNOpBxKq
	CcIVc4RjCpwEv70o7JRzzVdY49lDsZKn41eyG5Xda1xmkA1KLGRx3NCh39qP9bqb+YWthW/bE85yn
	HTlEgzy47cMB8+4/qkOQhM6caucqzeclNhc1Dv/EnpZ30BvzCa86eRvUf7pZiji1C8n+wDY4vmLVA
	edAM2fswm5zWKwhlxCp8+Z7xFqAEYk3R7fiXaXZoEUZh3pMuOg==;
Received: from [2a02:8108:8980:2478:87e9:6c79:5f84:367d]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1t6aI2-0003BI-Lc; Thu, 31 Oct 2024 19:53:02 +0100
Message-ID: <de6fd9b1-e0f7-4694-88df-6b16039f2433@leemhuis.info>
Date: Thu, 31 Oct 2024 19:53:00 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Fix beep notifications by Thinkpad's ACPI firmware
To: Takashi Iwai <tiwai@suse.de>, =?UTF-8?Q?Jaros=C5=82aw_Janik?=
 <jaroslaw.janik@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
References: <20241030171813.18941-1-jaroslaw.janik@gmail.com>
 <87r07wws4j.wl-tiwai@suse.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: en-MW
In-Reply-To: <87r07wws4j.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1730400784;207b0c6c;
X-HE-SMSGID: 1t6aI2-0003BI-Lc

On 31.10.24 10:15, Takashi Iwai wrote:
> On Wed, 30 Oct 2024 18:18:11 +0100,
> Jarosław Janik wrote:
>
>> PS. Don't forget to have this backported to LTS kernels, please.
> This should be taken usually automatically as long as Fixes tag points
> to the right commit.

Usually: yes. But a quick reminder: it also might be silently dropped.

If you want to ensure it's backported, a stable tag is a must:
https://docs.kernel.org/process/stable-kernel-rules.html

Ciao, Thorsten
