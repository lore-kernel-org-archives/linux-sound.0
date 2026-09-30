Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0633330E0C0
	for <linux-sound@vger.kernel.org>; Wed, 30 Sep 2026 07:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753160; cv=none; b=ftWv5BDqMo/XYMlPTJdtEbQdGRmOIaHdU11elyNOQsCX+KyJKNg+hG+IQ44P5da6t2H1Z8SBS/V2DhAeXz0goRvbsGSIPMUzpLiZa1V4MzYQkP8nqYZEbbapaMYTa2X8XXIsPS/b2UtcnbUI7cJqIr9NXhvWza6sWcXBh1p7r8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753160; c=relaxed/simple;
	bh=Tx5eyEQTpiF+54P1zaEJHUlNKuvyzhwVgGBMlfxjmDM=;
	h=From:Message-ID:Date:MIME-Version:To:Subject:Content-Type; b=aae4PWtxlBM6cRsSGUhFauTSJ57Ha0XnPL3aK3yXdCsJ6eL8VUPeLiRaeybWM9wtozb0EIpC6DQvZ2jfZj+AaUURAM8wIJEj9V7f0iZfqaZ7doaSwalavGWXmefWQmNG8/LFIuLi+3KCI4PPF7mkana54baxgOPVWKysev+FiOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YyFS+bdx; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YyFS+bdx"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4c4bf3defecso4013926b6e.3
        for <linux-sound@vger.kernel.org>; Wed, 30 Sep 2026 00:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753158; x=1791357958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:to:content-language
         :user-agent:mime-version:date:message-id:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jKPLOLLUCxjka00oprw8gLcGI155mzZAj0uc9Rsvz4s=;
        b=YyFS+bdxlDmrhaOxe0Ov4QenE5kI7zLnH35PDpeXRq4Bl6FnlWvBOKelXiEauT0S2K
         RmzAuzlJ1ijmqRE7hq3jJ8oK/xqu0TYyY4981CmpI2+Kxrqlp+hoMlOfn3XNGxVQsbN9
         qKZIsnjBihRpc4v6N6yVsiSSJN8682QX2ggwjAReHAizKzsUoOduxgsHHvxuHCwv7fC3
         JnH8n5E0YxeAEt58kdkM7++wzgKi6072hBvBslXM54Fy9LFNenCU35EGAKFtjjELgYyn
         HXGLdKo9UqpiSP2qOV2pWzZT+wLBHkt9UwYJekaCeST58XdyCkiuOxMdMeF6Z8yDqBE+
         xbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753158; x=1791357958;
        h=content-transfer-encoding:content-type:subject:to:content-language
         :user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jKPLOLLUCxjka00oprw8gLcGI155mzZAj0uc9Rsvz4s=;
        b=wGkqnbrURzCEt1g5Bmh3ahdZQ7ema1mstKEBbv9hrJKxJ/TD01kDNgIUx9Uv9eJUeP
         of+E88qmo37gIf/hLoMofNpys1KD1kTbQiXmbDzsTGiZm9Pasy9KrVsFHl5kHJNQrDiO
         7M1TrFaeZfbiyxAbBzPW7jAvzuBd0jKPThl84RA0Ip4amkYMwyHh9qHymmz4r4dMGtcs
         UbHb+Gc9ElatFzeKCZ/BfCmHao/38/fQwqDM+pEOpJHJQ8jecvK3YpM7HBxKEQMYblNZ
         OOUO9mZYO8Li9WMJxygkV5yRfiGv6Xw0m9dTpXsPEGt3wENBiX1e6avBV1eAu7ESfJD1
         JhDw==
X-Gm-Message-State: AFuF++mW2VXgJhaTrGfMVyRS6BNYVjuFVli6YCS2RdKv/GnnBj4LBtBR
	96UPoBgXIHphzIJvyeQP6VqfqGduMrhPhlHYryzp6HvnHPQ9PTDc8u+7LKMqY07HkQ8=
X-Gm-Gg: AYBFou1dGf3d1W2Ammgdfxr2yfR3SNLopxoIAAfmgaDC6fjDbcNmNJAhUZKC+kx+B4k
	KZZYe5Ll24BYAdvWJryqa8QDHtaPPzQMlbIxZTrH0Fmy0HRJpJwtc+ibmKu0Qr5Ac1iOVhqtuIR
	+YygLkLuCDfwFTtqquhzApCONVoyZfhHagJmyMjofhFrVGHgIL8zpeGC2rn5igxFoeBc5U3vy8l
	SUwyjfUlm68JilqOlZ+ARcf9nfvvfdvuJrPGNUWbEdEi249SVcmjb6VvkFzmGLV0TmlmwPjD6l8
	JG9dmHdE4bXpJZziW/9kPwT+M20H7gndBIrWnzD7YYWYYZ9kPZT97zvHc87gGeXhQPIpHoU3W+c
	K/zQ3Q2F7pqRSoNW98ihXWeCBBLrhwTmMHR3S8Itu8dXUNNwOyuC7jmh9t9/dDEEqYSo/Xu0WFU
	nvxQ5JzWyu/fnyFcHniaGUyjl/x1ESPWBtYUpnYYlBfjWcLW6XIq716wtN57CIx1sUJJhNZtYrd
	ypukgd0p64rcYcD8aEtoy+JqdhIVT6T6Iuccak3bEU=
X-Received: by 2002:a05:6808:50a0:b0:4e8:f158:504 with SMTP id 5614622812f47-4f1b9f27434mr518339b6e.44.1790753157591;
        Wed, 30 Sep 2026 00:25:57 -0700 (PDT)
Received: from [192.168.50.93] (71-211-250-13.hlrn.qwest.net. [71.211.250.13])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4f1b458f02fsm290110b6e.3.2026.09.30.00.25.56
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 00:25:57 -0700 (PDT)
From: Michael Harrell <michael.harrell455@gmail.com>
X-Google-Original-From: Michael Harrell <Michael.Harrell455@gmail.com>
Message-ID: <abcda578-9bef-4c96-952b-022daa276a98@gmail.com>
Date: Wed, 30 Sep 2026 01:25:56 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Content-Language: en-US
To: linux-sound@vger.kernel.org
Subject: Title: ALSA: hda/ca0132 - Sound BlasterX AE-5 Plus (1102:0191):
 center, rear-right and LFE randomly silent after codec init
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Title: ALSA: hda/ca0132 - Sound BlasterX AE-5 Plus (1102:0191): center, 
rear-right and LFE randomly silent after codec init

Hardware: Creative Sound BlasterX AE-5 Plus, PCI 1102:0012, subsystem 
1102:0191
   (driver reports "CA0132: picked fixup for PCI SSID 1102:0191" and 
identifies it
   as "Sound BlasterX AE-5"). Analog 5.1 to a Logitech Z906 (3x 3.5mm).
   AMD Ryzen (Granite Ridge) board, card is sole device behind bridge 
00:02.2.
Kernel: 7.2.7-200.fc44.x86_64 (Fedora 44), alsa-firmware installed,
   "ca0132 DSP downloaded and running" every time.
Works correctly under Windows 11 on the same machine and cables.

Problem:
After each codec initialisation (boot, driver unbind/bind, PCI bus reset,
or PCI remove+rescan), analog 5.1 output comes up in one of two states at
random:
   - good: all six channels correct
   - bad:  only FL, FR and RL audible; FC, RR and LFE silent
Roughly 3 of 8 initialisations were good in testing. Nothing in software
distinguishes the two states:
   - All ALSA controls identical (alsactl store diff): Output Select = 
Speakers,
     Surround Channel Config = 5.1, Center/LFE/Surround switches on,
     HP/Speaker Auto Detect off, Bass Redirection off, Full-Range 
Front/Rear on.
   - /proc/asound/cardN/codec#1 dumps identical apart from master amp 
volume.
   - Pin configs identical.
   - GPIO IO[1] data bit differs between some good and bad dumps, but 
was also
     observed as 1 in a bad state, so it is not a reliable indicator.
   - Result is independent of whether a plug is present in the headphone 
jack.
Toggling Output Select or Surround Channel Config after init (which re-runs
ca0132_alt_select_out / AE-5 ca0113 setup) sometimes turns a bad state into
a good one, but not reliably.

Separate but related: with runtime PM enabled (snd_hda_intel power_save=10,
set by tuned "balanced"), a good state is lost after the codec runtime-
suspends and resumes. Keeping the codec at power/control=on prevents that.
This suggests the AE-5 output setup (ca0113 MMIO / DAC) is not fully
re-applied on resume, and may be racy on initial setup.

Happy to test patches or provide codec dumps, alsactl state files and
kernel logs for good and bad states (collected on several boots).


Thanks,

Michael

