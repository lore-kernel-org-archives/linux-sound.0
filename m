Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD353A1A3C
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 15:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128096; cv=none; b=JRPnZMOcxI4nmDGatme1PbYJuEMotX5cPzpt3GrHLMVYCJDy/KdYyCKnKRQJxjMuJsmErL5+6Q0QkK1y5dH4fQjhhu4YNFgRjbt2dyr54JkGPsk0QCmE8K4Md+Rm3jz5fObN89+BtbRmKduRJD8M7RYp8WV7ToH/jTnmOEROuLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128096; c=relaxed/simple;
	bh=mAuGNpdeshVQcCVxMFCCmwIQu0nxqqcw5NpHlcSzjl8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=gQQgYdCQXuJ9ub/FggreIDL3pONT+AhfJCHVPsHsMXBVLH0aPmpeqe0Ss2mdl0mKTPUpo0EhKGlePzMO+TaqkbF6uc/ve2FOhVRigmzHrnJ2PRHcz4RfldT+ohCoU4ynLSSK3pHL0oPUcVDzUe+0V0EnGAYc3XvXwszF/vmY++k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWbS/EaY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWbS/EaY"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f3e6cc44aso3055089f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 08:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784128093; x=1784732893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:content-language:cc:to
         :subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ge3+kmve43T55UiM7iPMLluXDi5ajDGPwJQiwHJ/lbU=;
        b=jWbS/EaYX1MfOdljqUHOO9nICiylYenOHS5Loq8yUnH4nhAa4lpFrCm7H+gyOz+kUQ
         F80h5bhcOJbeMhTlwH1aStq3o8sYUxLdU7xlwgkFCYqk35HBpMTaYSJxrxvcPAvRVLUr
         gfmRY4tVsdgMVduAnB5W9yCAEGkOev7lgHZr5FskTY2HA0B1AYk3CxVkPzo4VX/nSCj6
         y2vLMcaIrHtjkFijjGNWlw9f968YFlVp1sH0aZliWfFvPSWrNE2HaCmzoGQlL+DQobcP
         ej2g4NCzuGCnI+ct/ANCwQ9TUAOodWY/iM5iG6zBslS8S4CakFTVvvhQ3ONSLAaNBUwW
         S6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784128093; x=1784732893;
        h=content-transfer-encoding:content-type:content-language:cc:to
         :subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ge3+kmve43T55UiM7iPMLluXDi5ajDGPwJQiwHJ/lbU=;
        b=s+8B+LWQKKhcjpdmIOpXak0xB+ZgVdahvf1PLxnRcB6rCSaA3UMCGp3FvJ5b64/6Gr
         h7IIXbev/9gt2mnS0dKCoxYw2QeMQP22uLEg091dRNzrWDR3ROtpWZdwXE3p0eNTKp2b
         P8K/0UTjB5pvk88Rjg9VtB/nXpeGwSJLC+9OooQVoTTzdUFYbDMKLKEvmWfADIKJXm3R
         Qdeq3I/vDGZf4+V5we6H0eqoGTilsPtQUZpIU2ApV2a68yynby5+QB4mdHmbtIXw2fet
         HtZk5DXZs4bxRkfm51M5K0Ijud+tcdgSV/Bv9HON6lnFeski/n5G2p20r8Z3K7fZBlbK
         s7ig==
X-Gm-Message-State: AOJu0YxWTBytog1xgzw/RKKq1r2Bfyd679sYuPL3mLx9luUE0ftThGMW
	coz439dSTcCqdIEQdhuD+ihGsJ3pUXA9+Z4vUYKUXyDfzfRpGGxOQ7OGqj3Jlu5C
X-Gm-Gg: AfdE7ck6OYsOvtVK0CMb6xHoYMh4v/QYvtNIPU4LDxgyot+873dVJPoKoiYU7FAcEv1
	rZaxwMg6tTLCxF4hz6RdrjlgYcuh//zv8Wz4A2Eq96+pgvKp2RyIy8lTvsHyvpdbGgb7T3ZzJfo
	TuttHqUKUzJZGFV02Aa9oBOl0DoRJe72dpzSxU+bUdgPv8CzQJs682vEVzblyYLraVYElfrlKLC
	Frj2F0naXDk4e/VkTMdHWnN21vWaOLP4jArVQCInekM+03zhFMOvTnIlJUc0o4dDPdko0eHqZAx
	O2yq14FmbSlfd45mu6O/1uJO/lU40b4wUi61W8gV6yuhM4L1oZqR+kWCZxJ/URsKaAGHn8RAiDQ
	QvleMl2hljXvSCYpm2F4gAWvv3gNx8fmY/IS1xybVrkwZdMforfuOeTY7cx3RiOr+v2K0/vklgc
	fXQVX2HO5DTxN4xMESyMVfEGA8
X-Received: by 2002:a05:600c:b90:b0:493:c182:6b08 with SMTP id 5b1f17b1804b1-49538a1e2famr77680395e9.36.1784128092666;
        Wed, 15 Jul 2026 08:08:12 -0700 (PDT)
Received: from [192.168.18.146] ([176.202.18.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a322dc6sm163843135e9.10.2026.07.15.08.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 08:08:11 -0700 (PDT)
Message-ID: <35264720-a5b8-4b08-8bd4-442c0bd5a8a7@gmail.com>
Date: Wed, 15 Jul 2026 18:08:09 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Salman S. Tahir" <salman.abusaad@gmail.com>
Subject: =?UTF-8?Q?=5BREGRESSION_7=2E2-rc3=5D_ASoC=3A_cs35l56=3A_component_p?=
 =?UTF-8?Q?robe_waits_for_an_init=5Fcompletion_that_cannot_be_signalled_unti?=
 =?UTF-8?Q?l_the_wait_ends_=E2=80=94_whole_sof=5Fsdw_card_fails?=
To: patches@opensource.cirrus.com, rf@opensource.cirrus.com
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On a Lenovo Yoga 9 2-in-1 14ILL10 (83LC, Core Ultra 7 258V / Lunar Lake; 
CS42L43
plus two SPI-attached CS35L56 amps behind it) the machine has no sound 
card at all
on 7.2-rc3. /proc/asound/cards is empty and PipeWire falls back to a 
null sink.

The right-hand amp's ASoC component probe times out waiting for 
init_completion,
returns -ENODEV, and ASoC then tears down the entire card -- so 
speakers, internal
mics, headset and all three HDMI outputs die because of one failed 
component:

[ 10.301...] cs35l56 spi-cs35l56-right: _cs35l56_component_probe: 
init_completion timed out
[ 10.301...] cs35l56 spi-cs35l56-right: ASoC error (-19): at 
snd_soc_component_probe() on spi-cs35l56-right
[ 10.302...] sof_sdw sof_sdw: ASoC: failed to instantiate card -19

This is 100% reproducible. Scanning my whole journal (151 boots, back to
2026-03-07): 11 failures in 11 boots on 7.2.0-rc3, against 0 failures in 
138 boots
on every kernel I ran before it -- 6.17.0-14 (1 boot), 6.19.4 (83), 
7.0.0-15 (20),
7.0.0-22 (20), 7.0.0-27 (14). It breaks at the first 7.2-rc3 boot and 
has failed
every one since. (A 12th 7.2-rc3 boot is clean, but only because of the 
workaround
described below.) Those failures were all captured on an otherwise stock 
machine --
clean kernel cmdline, distro modprobe.d only, no out-of-tree modules 
(other than the
timeout experiment below), no DSDT override, distro Cirrus firmware. I 
now run a
local workaround (a snd_soc_sof_sdw blacklist plus a service that loads 
it late --
described below); I can drop it and reproduce the failure on demand.


This is not a slow-firmware race
--------------------------------

The obvious reading of that log is "the amp is a bit too slow and misses 
the 5s
deadline". It isn't, and I want to save you from chasing that. I rebuilt
snd-soc-cs35l56 for 7.2-rc3 with a single change -- the component-probe 
wait at
sound/soc/codecs/cs35l56.c:1371, msecs_to_jiffies(5000) -> 
msecs_to_jiffies(30000)
-- and booted it. It fails identically, just later:

component-probe timeout | wait expires at | right amp's cs35l56_init() 
actually starts
------------------------+-----------------+-------------------------------------------
5000 ms (stock) | 10.301 s | 10.355 s -- 54 ms after the wait gave up
30000 ms (patched) | 35.901 s | 36.005 s -- 104 ms after the wait gave up

During the entire 30-second wait the right amp emits nothing. It does 
not even reach
the cs35l56_hw_init() identification print that the left amp produced at 
5.29 s:

[ 5.294911] cs35l56 spi-cs35l56-left: Cirrus Logic CS35L56 Rev B0 OTP3 
fw:3.4.4 (patched=0)
[ 5.603038] cs35l56 spi-cs35l56-left: DSP1: 
cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid0.wmfw: format 3 ...
[ 7.681077] cs35l56 spi-cs35l56-left: DSP1: Firmware: 1a00d6 vendor: 0x2 
v3.11.26, 41 algorithms
[ 9.498049] cs35l56 spi-cs35l56-left: Calibration applied
<-- 26 seconds of silence from the right amp -->
[ 35.901035] cs35l56 spi-cs35l56-right: _cs35l56_component_probe: 
init_completion timed out
[ 35.902534] sof_sdw sof_sdw: ASoC: failed to instantiate card -19
[ 36.005138] cs35l56 spi-cs35l56-right: Cirrus Logic CS35L56 Rev B0 OTP3 
fw:3.4.4 (patched=0)

So the right amp's init is not losing a race against the deadline -- it 
is blocked by
the wait itself, and only proceeds once the waiter gives up. Increasing 
the timeout
just increases the wait; a 300-second timeout would fail at 305 seconds. 
The amp is
not slow: once released it completes cs35l56_init() normally. (It gets 
no firmware
download at that point -- the timeout path returns -ENODEV well before the
queue_work(&cs35l56->dsp_work) at the end of _cs35l56_component_probe(), 
so nothing
ever queues one for it.)


The hardware is fine -- the card is just built ~100 ms too early
----------------------------------------------------------------

After the failed instantiation, spi-cs35l56-right is bound to the 
driver, i.e. its
probe returned 0 and complete(&cs35l56->init_completion) did run. 
Nothing about the
hardware, the firmware download or the SPI-over-SoundWire path is 
broken; the card is
simply instantiated before the right amp is ready, and nothing ever 
retries it.

I confirmed that by keeping the deadlock from forming at all, rather 
than repairing it
afterwards: blacklist snd_soc_sof_sdw, wait until both amps have 
signalled init, then
load it. With no card probe in flight there is nothing to starve the 
right amp: both
amps reach their identification print within ~260 ms of each other 
(4.744 s and
5.008 s), the component probe's wait returns immediately, no timeout 
fires, and the
card registers first time. Both amps are still patched=0 at that point, 
so both take
the full firmware-download path, and both calibrate:

[ 19.770067] cs35l56 spi-cs35l56-left: Calibration applied
[ 19.777038] cs35l56 spi-cs35l56-right: Calibration applied

That boot has since suspended and resumed with the card intact, and 
contains no error
or warning from cs35l56, cs42l43 or SOF at all.


Hypothesis (unverified -- offered only as a starting point)
-----------------------------------------------------------

Something in 7.2 appears to have changed the ordering such that the 
right amp's probe
and the sof_sdw card probe end up on the same execution context (the 
deferred-probe
worker would fit the ~100 ms lag), so the blocking wait in 
_cs35l56_component_probe()
starves the very work it is waiting for. I have not confirmed that, and 
I have not
bisected -- I am reporting the reproducible behaviour rather than 
guessing at the
culprit commit, and I would rather not send you down a path I only inferred.


Suggested direction
-------------------

Regardless of what changed the ordering, blocking in a component probe 
on a completion
that a different probe must signal looks fragile by construction. Returning
-EPROBE_DEFER instead -- letting the driver core retry the card once the 
amp is bound
-- would use the mechanism the kernel already has for this, and 
snd_soc_bind_card()
already special-cases -EPROBE_DEFER from soc_probe_link_components(). 
Something along
the lines of:

if (!wait_for_completion_timeout(&cs35l56->init_completion,
msecs_to_jiffies(5000)))
return 
dev_err_probe(cs35l56->https://www.google.com/url?q=http://base.dev&source=gmail&ust=1784212475584000&sa=E, 
-EPROBE_DEFER,
"init_completion not signalled, deferring\n");

I have not tested that; I did not want to submit a patch built on a 
mechanism I have
only hypothesised.

I have the hardware, I can reproduce this on every boot, and I am happy 
to test
patches, run instrumented builds, or bisect if that would help. Just 
tell me what
would be most useful.


Environment
-----------

- Lenovo Yoga 9 2-in-1 14ILL10 (83LC), Core Ultra 7 258V (Lunar Lake)
- CS42L43 (SoundWire) + 2x CS35L56 Rev B0, SPI-attached via the CS42L43
- Firmware: cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid0.wmfw v3.11.26 
(distro linux-firmware)
- Bad: 7.2-rc3 (7.2.0-070200rc3-generic, mainline build) -- 11 failures 
/ 11 boots
- Good: 7.0.0-27 (14 boots), 7.0.0-22 (20), 7.0.0-15 (20), 6.19.4 (83), 
6.17.0-14 (1)
-- 138 boots, 0 failures
- Only the 30 s-timeout boot above ran a rebuilt (out-of-tree, 
kernel-tainting)
snd-soc-cs35l56; every stock-timeout failure was on the untainted distro 
module
- Not bisected
- Workaround currently in place: blacklist snd_soc_sof_sdw + a systemd 
unit that
modprobes it once both amps have signalled init. Removable on request -- 
I can
reproduce the failure on any boot.

Thanks,
Salman S. Tahir
