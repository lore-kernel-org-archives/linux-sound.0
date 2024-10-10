Received: from host35.ssl-net.net (host35.ssl-net.net [213.145.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5491CB506
	for <linux-sound@vger.kernel.org>; Thu, 10 Oct 2024 15:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.145.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728572445; cv=none; b=F18zSXRMdlDSf3+ZF7BPXTiM5ac7pymPhno213WLAdhwzcJhnUqGra29H4F76CSDC7+cA9B+n1V1ViG+oBq+2MS6XluoUQjj5Rl6MpnxWKnXzds5CTRYn3SRuj8gk5MUACHkU6YV2mI8wi3IvMaotmcO2ZHT93m8gkv7UOZNH0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728572445; c=relaxed/simple;
	bh=rm35hIiuIPV8S0XbJyKnzRf7HNHVy31Uy15kpcwItrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mzj6bV9PT3UvH45HdQ+6JcgOO1v7Zyvw2P545isrDFQunt3zgngYpL7iXNv66wDBm3KP/Wcbstj6bTqj/l8IL25i/rI9AnPag+sLiyACS1S5gSGun9lVff/e78v0bV+Mk96jbO2uRAJr5j2Ey6M6vFbMCFHSmrKzl6eGXI7b01w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grabner-graz.at; spf=none smtp.mailfrom=grabner-graz.at; dkim=pass (2048-bit key) header.d=host35.ssl-net.net header.i=@host35.ssl-net.net header.b=JGwIfcBE; arc=none smtp.client-ip=213.145.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grabner-graz.at
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=grabner-graz.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=host35.ssl-net.net header.i=@host35.ssl-net.net header.b="JGwIfcBE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=host35.ssl-net.net; s=dkim; h=Message-ID:Date:MIME-Version:
	User-Agent:Subject:To:Cc:References:Content-Language:From:
	In-Reply-To:Content-Type:Content-Transfer-Encoding; bh=LVMJ49Qj9
	2EYlKQ+BN74kqMW0EcmH2qQLoAQZHDGyoU=; b=JGwIfcBEdhu0WBglrjeFCWgED
	sDwGMw37C5VaP+pyetiDYOZXEQTqFF+ZbJaLpuFZVERzLr0Ks6Wvl/a9gXbI4CpL
	w4Mv5Is+pgneqiKQZmJ00Z0g+z1jJpEVNel6awI7QNCK4ySQoWjS8+n/buFH/uTR
	SlURsJt9gZkvm/NYh9ArPu0lnO2P1+WeJGuiXTZUK3raRok/EUQH1brFkGbj3ZK8
	PxS68u5/4Sy27F91plMf2pEOICMPqYait/Yo+aY9iivDpSR6PyGv5AYhCFhK7/jW
	mtaE+Mqc/AX/0gTfaLeSRHWsDZ7uBiF/6k712vg5gz0kJJP8Ncz4RLArOVFPw==
Received: (qmail 962809 invoked by uid 7799); 10 Oct 2024 17:00:39 +0200
Received: by simscan 1.4.0 ppid: 962776, pid: 962805, t: 0.0405s
         scanners: clamav: 0.103.9/m:62/d:27423
Received: from 91-115-228-210.adsl.highway.telekom.at (HELO ?192.168.178.2?) (markus@grabner-graz.at@91.115.228.210) by host35.ssl-net.net with SMTP [45608]; 10 Oct 2024 17:00:39 +0200
Message-ID: <598c3b7f-ab86-4206-a1f7-a573e9fc59c1@grabner-graz.at>
Date: Thu, 10 Oct 2024 17:00:38 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: line6: update contact information
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
References: <20241009194251.15662-1-line6@grabner-graz.at>
 <87y12w17yb.wl-tiwai@suse.de>
Content-Language: de-DE
From: Markus Grabner <line6@grabner-graz.at>
In-Reply-To: <87y12w17yb.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 10.10.24 um 14:03 schrieb Takashi Iwai:
> On Wed, 09 Oct 2024 21:42:51 +0200,
> Markus Grabner wrote:
>>
>> The Line6 driver source code files contain an outdated email address of the
>> original author. This patch updates the contact information.
>>
>> Signed-off-by: Markus Grabner <line6@grabner-graz.at>
> 
> Applied now.  Thanks.
Thanks to you and all the other maintainers for keeping up the driver 
with the evolving Linux kernel! It is great to be able to do serious 
audio work without having to switch to a different OS :-)!

	Kind regards,
		Markus

