Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA031C701F
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 00:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783643522; cv=pass; b=XHr/4B1FhPhZhAwXeL2xx6EOnN3Hpa3ndlCoAXmpwBHD+luZDlh+SZqc1t/Cyr/PGdW3bX7sHVnlfCu026JmKpu0hKqKKwlJXziPojQAEE1TveJmy52qxOFHVD/6qU49dq5SP+V3ediU2jUlFHLxXF63qt1bmr3DTpZJzPv9qwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783643522; c=relaxed/simple;
	bh=vBl4x+V+Asbc3MQxeMEJZonPHPjS6M57HVycR71pCds=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=fe78mXQ9Yo3MmYciYTnbMGdBTYmmbKdUgHkeBlaXzRogvsvbwDGvx54wYqXE+8JyYCJhW/9xBbjk7CIoGkeoOzE1uJAUkcqzaDk4WBPNM2FUKT/DyHuPmNjNC+ziyQBUlZViWUhyZmcqPP6ZemP1Tbl7QQRv95AgKXwN+FKSzAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfC1jVv2; arc=pass smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfC1jVv2"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-44856d185bcso183381fac.3
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 17:31:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783643519; cv=none;
        d=google.com; s=arc-20260327;
        b=oJMhhdezJKON2523FAoiwE2AqBp1VyRWAupx3NvPmUw2JvyqPdgHP7GVIAdBh9HLCh
         DJPi5aXgFir0HI4N41xX69yW3z9Z1lASR0eYBQKwDCo4qO+q2JB2skJbhqnY0tYfXwq7
         pPC8y7HqdX3/CpWbjdortM+4Xkjv330XTM1LrIr+UHIOgjea9wIZxt1GhES3HTtY18XM
         Kt83Ibe1Lzj02YZa9x19rmB3fT+rIxwNelsDeE3a4+BJQGEe/49EEWnPLo7VlgqxAYWQ
         9WvboPcQGI2r/w3AnnGcXvLafNXv5ielc/ESRN5AUkJwuXbKAJVPO0yAceBZhrfZUiHD
         F3rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=mSBszlXMhea31a1nVnAoUl1WO3zE8MxWfMWDrQmo6P8=;
        fh=aAjySkCCJ0w505SsLN5frkjdB4MN2noKaJ5lPmOKroY=;
        b=rjcXF8C36z6y0iLRTcRjxwUca8Qr4U8CSlD8obPGEMVnGnjLTXBMR0Aehg0A9l3faI
         uIurOwXObkzxfo0PXE3Cr1qS62U7T07GA/IZAY1qmlzKMZxQIZnCzxN9A630lmPz8vR1
         lzjvH+cizKbSs6Ze/diwSwZaz6NOEx6IOfa0DDaNZVQo0q7LgpJHbxQTMqThFSgehPpO
         D6SvsanRQzxORfnyx3XwYACwJhPwvIoD21SOkccBGanGStetyer7epUlrjlJKwm7C+fF
         ALpkMR30QRlS4vaIdn+B0lOfZ72xSQGfVP/OVrxobMzbo/kRlwUStRHDr+JLo5hcvljO
         gkVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783643519; x=1784248319; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mSBszlXMhea31a1nVnAoUl1WO3zE8MxWfMWDrQmo6P8=;
        b=TfC1jVv2PcY0sFY2FACyGMqrLzGiEPVwkxH45WLKWrX2hustu2YQeKhHtj4CEbGuSU
         6VuzwdFh5EeDxqdTDYIX1+xuGncpWv0BF8J5dbw6/7DV+VfLsL7K9AhS2m8ouK7Pj28P
         sw+lh/d7ljkQ2WEDlvDAGrTIexxAQ7VkVY1nWcw6nXkOVXmvu0uC6wPxlN0TiEWJrA/w
         WE9DU83w/kkz3TZv+hfhNzblaT/Vs0kdnzpprZucHIW9tS+u7zHumJcnLkpcyixHBWnR
         ROSeZTSgwHTun01WD28+BVAy2sqdmYLh6wUmNZRV4rr4KH9I+qCiDXmIeB+rg8rfvuwP
         JqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783643519; x=1784248319;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mSBszlXMhea31a1nVnAoUl1WO3zE8MxWfMWDrQmo6P8=;
        b=UwQS75wW6AnWp7OnB0YPB8g2oPxZynFsnXjsHJpjNfTCETPIEM6YdvqriA0jGQUuAB
         A50YEeUDpEQGoH5iUJVaD9i0MgVN0HRdtAw0KH0imZZ3EC18AO+Jp0fFxuSqo8FXkeG0
         a+JQOsKYPykxTNyRVFSnDWACM+Aq3dUVBYfmXfHTK2sVLDQVmmEunQ5lJr3O0FBRwnRn
         Q//o/+vDb/g5PXF50IWwa9e9bDtNJF3wVfO9HFc0gT7wIcxbK0kz8rw6kU0uVNq8eVV2
         vGjLqhjernXpVKRGwGqoN+QoHAkdqvrepueTtlnTS17ULDa8QV/2Yq9vAch2PDxwLf3E
         WbSQ==
X-Gm-Message-State: AOJu0YwWSZDMiSV1XdUBPUI+J4+ycgI4sGPW3D6wzVMk34JV909ok/ul
	oTMPKGWJFUmQbIAVvyp97vnmTGF2wYyojnaJHANp0HGzdrYg5ShCW8mHrHtg8lR6Cj6o5L9vIXy
	kiKxhCwg5b13Hp90kYFMZsiYUtOFIJ/xWSLgky6ntNfLG
X-Gm-Gg: AfdE7cl+2FJAFlTkIrZTfTIJioIkMf6MZKFcu2jSZycpCs9+tlJMxVJc5S4rT6vv8/D
	qViNH+kAbs8GxfBqnr9PE16n87dD9B1LdE1NuMGoqNxsibGTFsTJVqVR26DbaqVrsqnqTMVAPNk
	3qVHzqIYCkZgYSm6XP4stsid2qZrIaq+no5Y1pXV8j+uQyi9fb1FEmkSMz8LcQ1p7XRxmNymJuM
	3/aSo1wn5K+zs38SUc6ii9nFDBpPwhreafk8GnfIgJZOQMeI+nSnjjNwEekfZjSs7loQxjZORna
	IwlRBPeGcdcVOghHOlvl2gA4AD9gJYw8sDnAIV/6zvNdl9KQ1lo=
X-Received: by 2002:a05:6870:c1c4:b0:43e:942:dfab with SMTP id
 586e51a60fabf-45163d50817mr6889197fac.33.1783643518713; Thu, 09 Jul 2026
 17:31:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?0J3QuNC60LjRgtCwINCf0L7QvdC40LrQsNGA0L7Qsg==?= <nick.ponikarov@gmail.com>
Date: Fri, 10 Jul 2026 03:31:47 +0300
X-Gm-Features: AUfX_mwF6VjDkb3IExN28qhI-p4oKr77sa_J0QRLFn6ryjuED9PFHpklW-guqpA
Message-ID: <CAPHjog1paFZ7rEO3MAVG7EYk5T7hhMBESyh-QkowcSwgomyUAQ@mail.gmail.com>
Subject: snd-usb-audio: Realtek ALC4082 (26ce:0a06) front mic ~22 dB too quiet
 until Speaker playback interface is opened (analog gain latch)
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"

Hi,

This is a root-cause report for a long-standing "front microphone far
too quiet" problem on the Realtek ALC4082 USB audio codec found on
recent motherboards (here: ASRock Z790 Taichi; device 26ce:0a06
"Generic USB Audio", bcdDevice 0.04). Summary: the codec raises the
front-mic ADC analog gain by ~22 dB as a side effect of the
Speaker/line-out playback interface being streamed, and resets it on
device re-initialization. No USB control transfer conveys this state,
so it is invisible to and unfixable from the mixer layer. Details and
evidence below.

Disclosure: the hands-on debugging (usbmon captures, the
per-interface isolation experiments) and this write-up were done by
Claude Fable, operating on my machine via Claude Code under my direction.
I have verified the effect myself by ear and by RMS measurement on
live recordings, the reproduction below is repeatable here on demand,
and I am the accountable human contact: I can re-run any capture and
will test patches on this hardware.

Symptom
-------

Front-panel mic capture (UAC2 interface 2) records ~20-22 dB too low
with every mixer control at maximum. Historically masked by desktop
software that resumed all sinks (e.g. pavucontrol <= 6.1 opened every
playback device for peak metering, which "fixed" the mic as a side
effect); current PipeWire stacks no longer wake suspended sinks for
metering, so users now hit the quiet state permanently.

Reproduction (raw ALSA, stack-independent)
------------------------------------------

  # 1. capture from the front mic -> quiet
  arecord -D hw:Audio,1 -f S24_3LE -c2 -r48000 -d 5 /tmp/before.wav

  # 2. stream 2 s of SILENCE to the Speaker playback interface
  aplay -t raw -f S24_3LE -c2 -r48000 -d 2 -D hw:Audio,0 /dev/zero

  # 3. capture again -> ~22 dB louder; persists until device re-init
  arecord -D hw:Audio,1 -f S24_3LE -c2 -r48000 -d 5 /tmp/after.wav

Measured on steady program material: front-mic RMS jumps from about
-61 dBFS to -39 dBFS after step 2. Opening the other interfaces
individually (second capture if1, Headphones playback if4, SPDIF if5)
has no effect - it is specifically the Speaker interface (if3).

Trigger conditions established:
- Any streaming alt-setting of if3 latches the gain (tested alt 1 /
  16-bit and alt 3 / 24-bit).
- A bare SET_INTERFACE toggle without isochronous data does NOT latch:
  wireplumber's sub-second probe open/closes during device discovery
  leave the mic quiet. Actual (even silent) streaming is required.
- The raised gain persists after if3 closes, until the device is
  re-initialized (e.g. sound stack restart re-opening the card).

Evidence it is not driven over USB control
------------------------------------------

usbmon capture of ep0 during a quiet open (only if2) vs. a loud open
(all interfaces): the diff contains only standard SET_INTERFACE
requests plus read-only UAC2 GET(CUR) requests (clock validity, sample
rate, connector state). No vendor-type requests and no SET_CUR writes
occur in either trace. The gain change is internal codec/firmware
behavior triggered by streaming on interface 3. Full usbmon traces and
`lsusb -v` output available on request.

Topology (from descriptors)
---------------------------

  if1 = capture,  EP 0x83, clock 3, IT 11 (0x0202 Desktop Mic)  rear
  if2 = capture,  EP 0x84, clock 4, IT 12 (0x0201 Microphone)   front,
                                                        affected path
  if3 = playback, EP 0x05, clock 5, OT 21 (0x0301 Speaker)      trigger
  if4 = playback, EP 0x06, clock 6, OT 22 (0x0302 Headphones)   no
                                                                 effect
  if5 = playback, EP 0x08, clock 8, OT 24 (0x0605 SPDIF)        no
                                                                 effect

Environment
-----------

- Realtek ALC4082 (USB), 26ce:0a06, bcdDevice 0.04, ASRock Z790 Taichi
- Reproduced on 6.16.1 and 7.1.3 (Arch), plain snd-usb-audio, UAC2
- Identical from raw hw: PCM, independent of PipeWire/PulseAudio
- Note: the 26ce family already has entries in sound/usb/mixer_maps.c
  (26ce:0a01 ASRock TRX40 Creator; MSI ALC4080 map), but nothing for
  0a06, and no behavior quirk of this kind exists in the tree.

Suggestion
----------

A device quirk that briefly activates/streams interface 3 at probe
time would fix the capture path for all users - or, if Realtek can be
consulted, presumably there is a vendor request that sets the front
ADC gain state directly and could be issued at init instead. My
current workaround is a systemd user unit playing 2 s of silence to
the Speaker device after each sound-server start.

Happy to provide traces, descriptors, and test patches.

Regards,
Nikita Ponikarov
