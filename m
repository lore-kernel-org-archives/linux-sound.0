Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch [185.70.40.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A0418C91F
	for <linux-sound@vger.kernel.org>; Tue, 30 Jul 2024 19:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722369212; cv=none; b=moXv7ZoBeMqhas9ZhfaM1u14PDml60ECQQQ8wKAaUkRexXz0/0OGGDlYSqrXkT3vc8xERBusUNNNmfQaeU+CMOYGigUjA4QZR21HCmLot4yEf3jdYloKGfZpLAHlVN+XyGFEhBjwc7tcCWmJaxPsWs4A9TrDeVWUKUsMPaQpLLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722369212; c=relaxed/simple;
	bh=cfL8K8oOZTus+Z0CZyjYAFSnbMx9FZoKUDm75n+8bXs=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SWFdlYgabuqOOe03sOUnm+UFVGtA/S589G2oFItT7/7+bKDLlw6QvkB8ftSmSyztReBhR7vNfvs4JVrI6wcy5jDHoz6FgiO5g3a2NlrKvCZFaT0XjKWFAAKGpM96+d/ojel0VINJK9/19/1mzGSlndeJULAXwpiFKu7VlNOV4hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=c712wpgT; arc=none smtp.client-ip=185.70.40.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="c712wpgT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1722369207; x=1722628407;
	bh=JZsQJ3qPV9zRVIItVT1nb+wNyCmtfkYU71yuifettk0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=c712wpgTuLcKOnZ6Ilthadkwkt1KO3vAANuOiLHoMICjcLnj326Cgt5d8FS+DENWl
	 85TcTm0KPeR03brt0p191vqPATGzJNu7BL5hiMHv4EOEpxeSnIi0yjmZHk2TiEYmvw
	 p4VVzQPnmbHrenJ604XI19Vk+IOzXkZ6trOntpG0k9/oCOFBp1TmGpe8uKgnr4zYbT
	 /yzgstI8zHntFFbO0JiSIY1O7Ig7IKxoi3t6gCkk5KNQoWXZMQHmmpCC9p5lP/3ehP
	 B2NFdh1cHJffWZ3iP64Ltz0p6A2UriBU7cZI+mssmCF46rEDPBSrD7kSy25jPEeoAR
	 G9PkSbp8Vhk/A==
Date: Tue, 30 Jul 2024 19:53:23 +0000
To: o-takashi@sakamocchi.jp, clemens@ladisch.de
From: Edmund Raile <edmund.raile@protonmail.com>
Cc: tiwai@suse.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v4 0/2] ALSA: firewire-lib: restore process context workqueue to prevent deadlock
Message-ID: <20240730195318.869840-1-edmund.raile@protonmail.com>
Feedback-ID: 43016623:user:proton
X-Pm-Message-ID: 10fe8f538ef80dff132c856927b6dd56a60806b0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patchset serves to prevent an AB/BA deadlock:

thread 0:
    * (lock A) acquire substream lock by
=09snd_pcm_stream_lock_irq() in
=09snd_pcm_status64()
    * (lock B) wait for tasklet to finish by calling
    =09tasklet_unlock_spin_wait() in
=09tasklet_disable_in_atomic() in
=09ohci_flush_iso_completions() of ohci.c

thread 1:
    * (lock B) enter tasklet
    * (lock A) attempt to acquire substream lock,
    =09waiting for it to be released:
=09snd_pcm_stream_lock_irqsave() in
    =09snd_pcm_period_elapsed() in
=09update_pcm_pointers() in
=09process_ctx_payloads() in
=09process_rx_packets() of amdtp-stream.c

? tasklet_unlock_spin_wait
 </NMI>
 <TASK>
ohci_flush_iso_completions firewire_ohci
amdtp_domain_stream_pcm_pointer snd_firewire_lib
snd_pcm_update_hw_ptr0 snd_pcm
snd_pcm_status64 snd_pcm

? native_queued_spin_lock_slowpath
 </NMI>
 <IRQ>
_raw_spin_lock_irqsave
snd_pcm_period_elapsed snd_pcm
process_rx_packets snd_firewire_lib
irq_target_callback snd_firewire_lib
handle_it_packet firewire_ohci
context_tasklet firewire_ohci

The issue has been reported as a regression of kernel 5.14:
Link: https://lore.kernel.org/regressions/kwryofzdmjvzkuw6j3clftsxmoolynljz=
txqwg76hzeo4simnl@jn3eo7pe642q/T/#u
("[REGRESSION] ALSA: firewire-lib: snd_pcm_period_elapsed deadlock
with Fireface 800")

Commit 7ba5ca32fe6e ("ALSA: firewire-lib: operate for period elapse event
in process context") removed the process context workqueue from
amdtp_domain_stream_pcm_pointer() and update_pcm_pointers() to remove
its overhead.
Commit b5b519965c4c ("ALSA: firewire-lib: obsolete workqueue for period
update") belongs to the same patch series and removed
the now-unused workqueue entirely.

Though being observed on RME Fireface 800, this issue would affect all
Firewire audio interfaces using ohci amdtp + pcm streaming.

ALSA streaming, especially under intensive CPU load will reveal this issue
the soonest due to issuing more hardIRQs, with time to occurrence ranging
from 2 secons to 30 minutes after starting playback.

to reproduce the issue:
direct ALSA playback to the device:
  mpv --audio-device=3Dalsa/sysdefault:CARD=3DFireface800 Spor-Ignition.fla=
c
Time to occurrence: 2s to 30m
Likelihood increased by:
  - high CPU load
    stress --cpu $(nproc)
  - switching between applications via workspaces
    tested with i915 in Xfce
PulsaAudio / PipeWire conceal the issue as they run PCM substream
without period wakeup mode, issuing less hardIRQs.

Cc: stable@vger.kernel.org
Backport note:
Also applies to and fixes on (tested):
6.10.2, 6.9.12, 6.6.43, 6.1.102, 5.15.164

Edmund Raile (2):
  Revert "ALSA: firewire-lib: obsolete workqueue for period update"
  Revert "ALSA: firewire-lib: operate for period elapse event in process
    context"

 sound/firewire/amdtp-stream.c | 38 ++++++++++++++++++++++-------------
 sound/firewire/amdtp-stream.h |  1 +
 2 files changed, 25 insertions(+), 14 deletions(-)

--=20
2.45.2


