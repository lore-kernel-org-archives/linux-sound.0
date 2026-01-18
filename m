Received: from mout.mail.com (mout.mail.com [74.208.4.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D763423B63C
	for <linux-sound@vger.kernel.org>; Sun, 18 Jan 2026 22:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.208.4.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768773965; cv=none; b=A4XZFsrDCy7vD8lKVnUyEmr20pK6wZFbcxMIgpwLurwzw7ayoQU+qL8+i5FVF1KV90F0tYP/9jQo+rSEZB2HgO+MwQ58JB0frDGo0H1/RyaP11sfoLUOjNtpr4pYY9Uid8kzVZflaYkBVZ45S28wzJ89Oxz8bzSiYMTTn6KA/UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768773965; c=relaxed/simple;
	bh=de+3ozmQ1RlVinPdquJA9bHMTR4Ya6iZDiYBdi4qRWI=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=HXOKy0lp7FIAeDZ7MtiA/sem5UdZLsyuCI5F5eO0bQ4Q8ZV7JYyKBNNtPyHtyq9Cd9+8ZUBw/dGMMiizs/ECtcnqn1b0dTsb+xfEvkCcYvl3gcibb9LI7M/wMP4BBWTdzcFBDvf4KpRTjH52R78wZ6iYm8gTTtuajEJGZGF6R2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.com; spf=pass smtp.mailfrom=mail.com; dkim=pass (2048-bit key) header.d=mail.com header.i=fenugrec@mail.com header.b=VOBRoHgi; arc=none smtp.client-ip=74.208.4.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.com header.i=fenugrec@mail.com header.b="VOBRoHgi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.com;
	s=s1089575; t=1768773959; x=1769378759; i=fenugrec@mail.com;
	bh=de+3ozmQ1RlVinPdquJA9bHMTR4Ya6iZDiYBdi4qRWI=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VOBRoHgimkN+1LVLbUJs+BrYbTZhoZZzOVVZ+Xq2xQjy9ywR3LP+2491xH/VUGJF
	 ufMEtDSQ9RntGcVg/QOHParEF1rtb+RPcVbXgm9Awe2pjXoMCTeaODcrvkPyaOWYk
	 Fq7ydGx/NTVgX/hhl3p+kao3+xSYzXBe3hxjfkpPVEaBUz30euwqKl/QxkRdLBJmQ
	 zrhxXUtO1sYBGoCFu+bYmnwqmAt1LrF9LNsktKr45urQ30NtzJhLzpiWNsSBFP8eF
	 3EsaGcGRA/7pDN5tN5N/BLGhmbA2mg9ai+MF5i2KwH362qyOryXHVyikrDuWpmdMc
	 gGRZPUfM58JEeh1QHg==
X-UI-Sender-Class: f2cb72be-343f-493d-8ec3-b1efb8d6185a
Received: from [146.70.198.39] ([146.70.198.39]) by web-mail.mail.com
 (3c-app-mailcom-lxa05.server.lan [10.76.45.6]) (via HTTP); Sun, 18 Jan 2026
 23:05:59 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-a36fc20e-92bf-46ab-b07e-83ca4d72d4b8-1768773959441@3c-app-mailcom-lxa05>
From: fenugrec@mail.com
To: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
Cc: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>
Subject: Re: accidental revert of Presonus 1824c quirk ?
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 Jan 2026 23:05:59 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <aWFo0EV2eWhJrNTk@corsair>
References: <trinity-0d3414bb-7704-4eb9-b805-01baaa2fcb8d-1767805061344@3c-app-mailcom-lxa05>
 <87h5swh8m2.wl-tiwai@suse.de>
 <trinity-f8cff6e0-b542-4caf-bae7-2a84a9a58d59-1767886416445@3c-app-mailcom-lxa07>
 <aWBE7DlmgZLoDkaI@ark>
 <trinity-46fb2e4e-993c-4225-b831-2d03dc541780-1767918098396@3c-app-mailcom-lxa07>
 <aWFo0EV2eWhJrNTk@corsair>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:GQ/O35nnEoA1Q9jdAVhsKWD7e6LjP1Ec7Trv6HSeqJuDtqsoXCK2VhLzwsWa2SNQA/XJM
 096jEgzMX0LJuRHZXF9pzHgaSBUXvHmHDXbYzYHoOBQK5Z2GObLBUHxOmQzfJtWZRU+0rHlZQqES
 FnCwIsJk5V7mlF82mqFOuQVmCCbhZeAgEj9/KD/CaQj5Td8iltr9wV/JORPv+viGgsEsCJ2n1Ea7
 ouYm56qgtNV8/D9UkJJc7W4y8Xd+JA7afgHTZXuOUXKD8L7cSIUoemaQg3QabRcTDN32vJJ/vakq
 Ho=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4L96uMTUfNY=;hhGWg4/uCWEJ0j4DCNLffK+ZLpy
 +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

[Solved] For future reference:
I was wrongly suspecting the linux driver, for what turned out to be an odd hardware issue.

I've documented full details here https://qcte.ca/audio/presonus_1824c/#chapter-2-clocks
but the main points are :

1- my 'arecord' test was flawed; specifying -D sysdefault:... doesn't necessarily change sample rate as expected
2- the problem was present with a win10 VM as well as another (native) win10 machine
3- the problem is caused by a distorted clock signal internal to the device.
4- the fix was to replace a component (ferrite bead) driving that clock.

regarding #1, I never found a good combination of args for arecord that works as expected:
with 'plughw:CARD=S1824c', it sometimes doesn't change the samplerate;
with 'hw:CARD=S1824c', it's very picky about # of channels and sample format;
(why does it insist on 32-bit float, when the USB-audio descriptor defines 24-bit signed ??)

Some arguments were always helpful: '-vv --dump-hw-params --disable-resample'

For me, this is solved. Thanks Roy for helping me look into this.

If you have an 1810/1824 and an oscilloscope, contact me off-list, I'm curious to compare notes !

