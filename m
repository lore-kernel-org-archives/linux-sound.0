Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794023628;
	b=0PrPI0KmYYSF+fkx4KFsV7RUZbUajTTS0I4tnaooiBqFLxTfbIAv/OQTCZFNTJDE8+Bz
	 qLCNgdbx0PxP4fVg2UM8I0YWJJKt38uYRUCt9YHXW/l7bJA/WVaL9FzBgBF7rZA9Vm53H
	 q1woVusHbRZO7DjCyJKULjMtHF4RrUd9ZHD77IxcBefIlbJFsDKKSPBpsLdtC0JkXX74B
	 6NhZka1ZoZWSQC0i5H7i2kYqa8QOyCPWohSNzjvcZ5+JgsRSVVNSuJ2/7tqHX9GBhz8Gf
	 Iz9iEDR5a5fDGHU5DLJzPWAy+vG6pi5YwHcqZxRWkLnexW7kmNk/RhROxzA8/0MdR9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794023628;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=NpEfv9kgZXTwBdGnW4In2VZOywQE0ScN9nWj1OZGRG8=;
	b=D7AGKjfRQYL/2azHF+8RhCST9d3wARFDmRTb1EoyYHvakmGOrt/2GomXVs1tRh8Bf57x
	 tc6zJcNR3PpaAV9L37pT75YxWKnMPYSTZAkYS7Cbc0aJfs4LWyLdAhrFRMchOyH/mUsXQ
	 mdUigeCYg2AZFQAIcrWHaIb7p/HYV0Rz2duGy/rcMxLgWiiTbLwCU4fkuNvj+pqNH6Qwc
	 2aczmAChkLTFAsvCZnRWW7uza+19w3kKjVqAhWmuYRisBCTbUJ4bQc7bCIg/EBFGcmPZu
	 AoFV6/EhobJc4F7HzMiPAVNgcfVulJi2RqpuZWfbCHuxSRK46LqrlverStAQ8kjAuBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lina.yt;
	spf=pass smtp.mailfrom=lina.yt;
	dkim=pass header.d=lina.yt header.i=@lina.yt header.a=rsa-sha256 header.s=key1 header.b=G0qT+yBE;
	arc=none smtp.remote-ip=95.215.58.207
Received: from mta1.migadu.com (out-207.mta1.migadu.com [95.215.58.207])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BB6606A33D
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 03:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3BB6606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lina.yt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lina.yt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lina.yt header.i=@lina.yt header.a=rsa-sha256 header.s=key1 header.b=G0qT+yBE
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Jvpe0BaTMJcnmW3usWyqkU/IB7QG/YJSErMZ+HCdxfs=;
 c=simple/simple; d=lina.yt;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794023624; v=1; x=1794628424;
 b=G0qT+yBEM0poSYMqo4ttw4eoXHJ/FsQFzhiZ7rBkN/TJYMN5nJ4rueDGvR59TmFInpc3R6OX
 EGLe6qvw3/wmlBkz+fydVxrzd2cGr4wqcTuaeFpxST2EkDLl5NIcfeQBBUm4RDjTYB2qF3FdwXK
 bWhij1+F/po1S7cyHHDmqMfPXWJrxx/eJLPlIqgC7OUib2QMcqMaLkng8nnh89j5K2dzgLRMf4y
 54YxnrpFjm5esXkc3q6LM8WeJI9E/zIk5ljdBmk7yUFRif0+2tsWFE5UKHMPIb2BDU5O2WVbp2c
 z/HCC1iX+qTeXUYHSyHnHDtW9lGSR4aUJIw4TzIMtONTw==
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c9961d11a865831c;
	Sat, 07 Nov 2026 03:53:44 +0000
X-Mizu-Trace-ID: c9961d11a865831c
X-Migadu-Flow: FLOW_OUT
Message-ID: <fd618d1b-d4b2-44cc-b08d-7e664938e771@lina.yt>
Date: Sat, 7 Nov 2026 12:53:37 +0900
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
Subject: Re: [BUG] ALSA: usb-audio: RME Digiface USB (2a39:3f8c): corrupted
 playback on ~20% of stream starts, fixed by quirk_flags 0x100010
To: Christoph Cheaure <cheaure@gmail.com>, linux-sound@vger.kernel.org,
 tiwai@suse.de
References: <CAJr_eQ4QhhZTqjVRmRWLBMMVhqmx-dS_yC9TiozB8qS-ZCnDTg@mail.gmail.com>
Content-Language: en-US
From: Hoshino Lina <lina@lina.yt>
In-Reply-To: <CAJr_eQ4QhhZTqjVRmRWLBMMVhqmx-dS_yC9TiozB8qS-ZCnDTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 2026/11/07 8:26, Christoph Cheaure wrote:
> Subject: [BUG] ALSA: usb-audio: RME Digiface USB (2a39:3f8c): corrupted 
> playback on ~20% of stream starts, fixed by quirk_flags 0x100010
> 
> Hi,
> 
> I'm seeing intermittently corrupted playback on an RME Digiface USB
> (2a39:3f8c) with the in-kernel support added in 6.12, and found a
> quirk flag combination that fixes it for me.
> 
> Symptom
> -------
> On roughly 1 in 5 stream starts, the playback output is corrupted:
> any non-zero signal comes out heavily distorted / with clicks, on all
> outputs, including the analog phones output (channels 33/34). Digital
> silence stays silent, which made the problem hard to spot. The bad
> state persists for the whole time the PCM is open; after closing and
> reopening, the next start is usually clean.

What you are hearing is what happens when playback falls behind by one 
USB frame on the Digiface. This happens mainly due to a bug in the xHCI 
kernel driver related to isochronous scheduling when IRQ latency spikes 
occur (together with the Digiface handling playback underruns rather 
poorly). I no longer contribute to the kernel directly for personal 
reasons, so I filed it here on Fedora, but it was never triaged/forwarded:

https://bugzilla.redhat.com/show_bug.cgi?id=2451673

I mitigated this issue by manually binding IRQ affinity of xHCI 
controllers used for audio to specific CPU cores, and keeping other IRQs 
off of those cores. I wrote a tool for this here (which is intended to 
improve low-latency proaudio stability in general and reduce xruns, 
mitigating this bug is just a side effect):

https://github.com/hoshinolina/proaudio-setup

The quirk will not fully fix the underlying issue, which can cause this 
to happen any time a latency spike occurs during playback. However, if 
you find that it happens often when the device is opened, and the quirk 
makes that more reliable for you, it sounds like a good idea anyway.

It might be a good idea to take a usbmon log like I did. That might 
clarify whether what you're seeing is the same latency spike I was 
seeing happening some of the time early on during PCM open, or truly an 
issue with playback/capture open order. If it really is a startup order 
issue causing the offset, then the quirk is correct regardless of the 
latency problem.

(Note to anyone submitting a patch: I do not receive patch emails or 
most anything else kernel related these days, nor do I have time to test 
patches personally on the machine with the Digiface, so please don't 
expect me to review/reply to anything that comes from this discussion.)

> 
> Environment
> -----------
> - Kernel: 6.12.95+deb12-amd64 (Debian bookworm-backports), x86_64,
>    Intel NUC (Tiger Lake)
> - Device: RME Digiface USB, 2a39:3f8c, bcdDevice 3.01, high speed,
>    on xHCI 0000:00:14.0 behind the board's internal VIA USB 2.0 hub
> - 48 kHz, 34 out / 32 in, S32_LE, period 384
> - Clock: synced to S/PDIF input 1 (external master clock); the
>    problem also reproduces with internal clock
> 
> Reproduction (PipeWire stopped, plain ALSA)
> -------------------------------------------
> - 34-channel S32_LE 48 kHz WAV with a 400 Hz tone at -24 dBFS on
>    channels 1/2 and 33/34 (phones)
> - repeatedly: aplay -D hw:CARD=USB24262729,DEV=0 tone.wav
>    (3 s per run, 1 s pause, each run opens the device fresh)
> - listen on the phones output: each run is either clean or corrupted
>    for its whole duration
> 
> Minimal reproduction (PipeWire/PulseAudio stopped):
> 
>      python3 - <<'EOF'
>      import wave, struct, math
>      amp = 0.06 * 2147483647
>      frames = b"".join(struct.pack("<34i", *[int(amp * 
> math.sin(2*math.pi*i/120))
>               if c in (0, 1, 32, 33) else 0 for c in range(34)]) for i 
> in range(120))
>      w = wave.open("/tmp/tone34.wav", "wb"); w.setnchannels(34); 
> w.setsampwidth(4)
>      w.setframerate(48000); w.writeframes(frames * 1200); w.close()  # 
> 400 Hz, 3 s
>      EOF
>      for i in $(seq 30); do
>          aplay -q -D hw:CARD=USB24262729,DEV=0 /tmp/tone34.wav; sleep 1
>      done
> 
> Each aplay run is either clean or distorted for its whole duration.
> 
> Results (bad starts / total)
> ----------------------------
> - default, external clock:                  2 / 30
> - default, internal clock:                  7 / 30
> - lowlatency=0:                             no improvement
> - keyboard/mouse unplugged (same xHCI):     no improvement
> - quirk_flags=0x100000 (FORCE_IFACE_RESET): 7 / 110 (~6%)
> - quirk_flags=0x100010
>    (FORCE_IFACE_RESET | PLAYBACK_FIRST):     0 / 90
> 
> Exact setting used (/etc/modprobe.d/rme-digiface.conf):
> 
>      options snd-usb-audio quirk_flags=0x100010
> 
> /sys/module/snd_usb_audio/parameters/quirk_flags then reads 1048592
> (= 0x100010) for the Digiface.
> 
> While the output was corrupted, recordings taken on the PipeWire side
> (sink monitor) were clean, and the problem reproduces with plain aplay,
> so the corruption seems to happen after the PCM buffer: in the driver,
> on USB or in the device.
> 
> I have not yet tested a kernel newer than 6.12.95
> 
> Would it make sense to add QUIRK_FLAG_FORCE_IFACE_RESET |
> QUIRK_FLAG_PLAYBACK_FIRST to the Digiface quirk entry?
> 
> Thanks for the Digiface support!

~~ Lina
