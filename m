Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579034;
	b=vkFJRhy3J/yrNDjdyuVaYnMSt4qGxPJ4VtcNqMwE+Q8YPjmqGZy4LKxVjuJryQVJcnTs
	 OhilxGqzxfuhZjX31kqKTYT+Ugk/cx8fhVW3K3UGOduw6y3FwrdZkTufCpXLCpBnHaKPl
	 CaUEQtK/3yezhzX2KSlZeWh7Z0QsEPDaV9874Hqf/g2G4gBL2r3ID75egRFvT8XRofRpH
	 pm2aL8AyhAA2nQZwvZGzqQtrsGEcOqiiHr45xSeA+GJ4pduJPCk8g+tYLo8GGRNFnTDaJ
	 v4qhM+e3Iik2V01UxNx0a40JHdJyo9MnnsjH3NmfGCrmyvb/haimYPyFMsEvv03msow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579034;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=NJSG4MH3JAsM/xTzeoS7yh0rO+miVkl0hZ7MB4tPMpc=;
	b=Ud2rCbKz244an0Hyxay8/mzcxtvjcuYzD/N0mwfOaWAC4QA9QxclfFeGorMygCgUfZfw
	 FtqxiI/SOacYSczZWyTXS8hIc4Qr4MTbaP+9KfeAHcFDy1X9V2BeTurW2T6Il5sMrCE+m
	 kbfaE7V51xJuCwdOCU515EfAQ+ilkJDJJqaHkGfd0bMZtfgTn9gyhlE3pTi3E5uJxNUJ6
	 AqS8x/mGmBdg8DjVA4cfFZ0GsQBYzRcDK6Wut/nzd+FWCyo1pTmRG+N73zS1fXufaWsTJ
	 oZnYzUmZlhPOtPA3VXpmqwRsGDHbDn4Fk6VsL0yeCBwDDZTardyM0+JU2bZnPR5q7mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=hS1VZipD;
	arc=none smtp.remote-ip=212.27.42.1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEBE606A319
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 10:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CEBE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=hS1VZipD
Received: from [IPV6:2001:861:61:4fb0:8b30:70ef:51a9:34a7] (unknown [IPv6:2001:861:61:4fb0:8b30:70ef:51a9:34a7])
	(Authenticated sender: jjacinto@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id EA98FB0051B;
	Wed, 21 Oct 2026 12:37:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1792579026;
	bh=0852g0U5bhWwV4zq7ymGDkcOiqAeU3hZ5ddTVqtyRAM=;
	h=Date:To:Cc:From:Subject:From;
	b=hS1VZipDsMDHf8M0tdciNsZzKcXxP0nYAmp9RWuu+xFNeNJxm+wvk7MkJZPYdWQGm
	 WXRm/XkLVCgeMRjF9niY192MNZ4Vsts5wyEprC/90gH+mykwyf9NstPn9JUkXqq/qb
	 rMYNv0KNmk/sfXC/jJn32UPr75m7kCOYuuR0xfZ6sBYcRq29t+nzl01waWlMY2iFky
	 XGJJhN8BE0IWXSQj1bgkmeqcmt1Vb3fzdJcHW+JN7UzuKROhvCjHpvO9aRlnSvn9uR
	 RWjK/KOYV+su7HGFp32OaJRR80b/3Eu4Z5RftgeD4VHH8/t2AxceTBz/HmKH731dV2
	 q/L8xAhwrsRtA==
Message-ID: <6a0f41ea-6dc4-4d57-89a1-9110bd246f0e@free.fr>
Date: Wed, 21 Oct 2026 12:37:04 +0200
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com
From: "J.M. Jacinto" <jjacinto@free.fr>
Subject: usb-audio: Vestax VCI-380 (1aa1:0240) choppy capture until SET_CUR
 sample rate is sent
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Disclaimer: I used AI to analyze a bug I was having from a long time 
with my sound card under linux.
The inputs were stuttering on linux, but plugging the controller to a 
Windows machine then back to linux solved the issue. Could it be 
possible to enable QUIRK_FLAG_ALWAYS_SET_RATE for my hardware ?


The Vestax VCI-380 DJ controller (USB 1aa1:0240, UAC2, single internal
clock, 48 kHz only) has a corrupted capture stream on Linux: a block of
samples is dropped or repeated every ~90 frames (about 140
discontinuities per second), heard as choppy sound on all 8 capture
channels. Playback works fine.

Cause, as far as I can tell: right after power on, the controller
reports 48000 Hz on its clock source (ID 41), but only configures its
clock when it receives a SET_CUR sampling frequency request. Since the
reported rate already matches, snd-usb-audio never sends it. The
Windows driver (Thesycon based) always sends it, which is why the
inputs are clean after using the controller on Windows and plugging it
back into Linux without switching it off.

Sending a single SET_CUR of 48000 Hz to clock source 41 from user space
(libusb, with the driver unbound, then re-enumerating the device) fixes
the capture until the next power cycle: the recorded input goes from
about 140 discontinuities per second to none.

It looks like what QUIRK_FLAG_ALWAYS_SET_RATE was added for, so a
quirk_flags_table entry for 1aa1:0240 would probably be enough. My
kernel doesn't have that flag yet, so I couldn't test it.

Kernel: 7.0.0-38-generic
lsusb -v output and recordings are available if useful.

Thanks,
JM Jacinto

