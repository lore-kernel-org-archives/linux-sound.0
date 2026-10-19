Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792450936;
	b=uaGf8gUoUlAgVkYERU3rXaCrhMDoy9jPR6DsDPd6XKUaMnYf57NXTZJQBNfZgeBxgeEu
	 fOOX/itrRkWaTxpWLbidGNIXTiIBabUfTyZvmbRqmnfh2genCdTOlaNoJ2jhG8iCqWqWY
	 ciV12+yHL5SJgX7jb7OKoBSXDCf7r1oT/zMT0KBm0U2EPyj+4FYXCldqlkdMKpCCvWC9y
	 PCwq2onVJL2uE6I9BhfiHe4anugpaedySCoknLuO8PlaB+bw8sAA/V6ibmgugjecQMGNB
	 97VDJfckztBnhwyotEQHqMUzcJpvBh+TfMWdcRv9ng8/Gr23UZvTEh5XJUJchgpUCQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ATl0o5hKkBtNJGh5uNJqlcxf+TKL5xfzOgAFm6I60fw=;
	b=JCUwiVqLH4/BgYvQJllpZh6Wj7PT+YvW4/usgwBpLMOjuThilLh/vVPnrOi12HYk2lg9
	 Rtvq1gXuU0I5lh7KBlw2kLas0rjt/Lt3GYXsH2n02fZy9rk4FKVVz8wntHtSQqqdCneVQ
	 TqH0i4WGJcJhzQEAjfqCCDmkpigcJXQTJfmiDRfQ5z59aNN0oOmGmAOZSPO9bUrv3nfFA
	 pz4BoG3LVSEZujlyh2VQWlsaIw0M52koCB7JiZCgViXuzehOj9yNMGOg2oQCwcZjhLzhW
	 V6hb/LHbWR/Vz9wRePUMFjLs2JFmcu3q1iTsT4N6/Cd8RORwifC6k8moBmsPARM6I4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tNARRPQ4;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D11E606A319
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 23:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D11E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tNARRPQ4
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6fe4372c5f3so1739084eaf.3
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 16:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792450934; x=1793055734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ATl0o5hKkBtNJGh5uNJqlcxf+TKL5xfzOgAFm6I60fw=;
        b=tNARRPQ4mNM/vLD64uL7mKOijZn6uJPyTry8njNLN/aMfCKF9duv80uwR0CqyqcpMl
         Sf1PBYOkqYFsXUka8lW2er3VsnvnDKvxJf2IAU9Zv3pklKyVWRYZMW1b7QmSoNCAhhsV
         fLPN+nCuYFDwNVUppnatR5/yXW9VBaaeuT4Ftm5IBy5wCwf+/Ts4X2lMInTIIphQHo/O
         KNIsFCuC354G/IP0JBWoRstFxm7Khf1YF5YlVs3krQUJcU72ZAvVuVCEcOMM1/Xmc1DB
         o4FkTq0FYbqnQ+KF9R5LdWwUwV/xWCRD0pxH534JKMGJnkia1pV3Q91H7pnTk5B/19X6
         RZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792450934; x=1793055734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATl0o5hKkBtNJGh5uNJqlcxf+TKL5xfzOgAFm6I60fw=;
        b=pQzcmlWYOi5pHCoeZpbTpwRIjmN5vjD0W6kPKqF2eZwMOp795aDhAXNRgesgBaO5xq
         BsdjXqzHtUXd7LfSXGrB/kOGIhQUDRBp44IXApbecxLT2ka9a4t584GhFKKC6t9KOuzA
         rdnlXY510/ls0FFpt/3WwPIMDQU0/t+mZ7aPz9XiVXFcuBugpD0TvSkFlsRFWFVZFU5r
         284CxHiKIVEa/ovgXmEBYPhbjMoaSZF1GHyF5Gp1wduuXltm2lKrmG5zKx0u2OsD7Xue
         1kxkKP7wkc4Q9KZB4RuoER6uuvClWVeKOmRupJ7w/4xjG9hB+oLJFP7krAKFwwHq5UcO
         Tp7w==
X-Gm-Message-State: AFq9FYIJKkaGfqQVnllYMaV48aNKQeFjmpyCf0QY/qiewxuQYZCStfA6
	7+C+mB2FNkI+V5fwx2VuO/eWImIWcAv6FXh/Twd7eVaUqr8+X5jE+/v7
X-Gm-Gg: AYBFou3WOqQU0NRZ/UTqzrKUBqC6Au7aUJJhtF1dEjupEmDAbfekJ02Q66pE1pXmR1w
	W3/6Zb3krQ10qsEVjs56fXQkLgBcRhS/U030Xci+ZtMm+GDXmvW/67haQjsJeAKWV5OK9TBaRra
	JMb1A7My3ixCrulELHNbHrQFVLt9z3tXBl1I3KSnCqnj9b3KS0pADL7deB1b02+VZwgvNqpEuQd
	AOfl1aMANcxLUAMB01jnilPZxg8Swn3Nc1KzRc8Gy4gLhcMMgFtueA5ue+fFnQEolPXuSynA+sG
	PVv7Hp6FBehjmTf+3mkUGp+B0SB6Wn8vtN/iG68fllkqBtQzhWcRdWuXckbt7qRihKJwPa8FhyG
	sUp0VGPPq/oFvXlQ2XgygI3NujsjRKTVljzvCdd7U9MN3pX8NpOyN/AFIj30eq4cor1BNqGdbky
	ph1OeJvdxX1hIkKpZy6w09Kd+FUS5eg99T0X8M+nO6uUdWiaYElLyxdQ6JWZ+3DCNvOxmyaDvLr
	IoxXIf/ntqkVnmjmjZUbFbWlg==
X-Received: by 2002:a05:6820:1694:b0:703:34cb:a3bd with SMTP id 006d021491bc7-7035287bda1mr6580369eaf.4.1792450934312;
        Mon, 19 Oct 2026 16:02:14 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a73b6d7e0csm9327797fac.12.2026.10.19.16.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:02:12 -0700 (PDT)
From: Will Porter <mrwillporter@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>,
	Will Porter <mrwillporter@gmail.com>
Subject: [PATCH 0/5] ALSA: usb-audio: Audient iD14 MkI vendor controls
Date: Mon, 19 Oct 2026 18:01:54 -0500
Message-ID: <20261019230159.834954-1-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Audient iD14 MkI (2708:0002) keeps its monitor section, output
routing, mixer and input options on vendor extension units. It also
uses feature units whose descriptors declare no controls. On Linux a
user cannot change the routing. The device powers up with every output
on DAW Thru, which bypasses the volume knob.

This series adds those controls in a new mixer_audient_id.c, one group
per patch. A MkI-only name map hides the generic controls that each
group replaces. The MkII keeps audient_id14_map.

Scope: only the iD14 MkI is supported, and only its USB ID reaches the
new code. Other Audient iD models keep the generic driver. Their units
may differ, and this series does not cover them. The file follows
mixer_scarlett2.c, which began with one model and added others through
per-model tables. Names with id14_ hold the MkI's unit IDs and tables. A
later iD model can add its own tables to this file.

sound for-next also has mixer_evo.c for the Audient EVO 4 (2708:0006).
EVO and iD are separate Audient product lines. The iD14 MkI uses other
units and a larger control set: a monitor controller, output routing, a
14 x 4 mixer and write-only controls. So this series keeps the iD line
in its own file.

At probe the driver writes only controls that it cannot read back: the
write-only controls (patch 4) and FU 12 (patch 5). They get the launch
values of Audient's iD application. If a probe write fails, the control
shows the fallback value that those patches describe. The driver does
not write the routing or the mix. User space (alsactl, an application)
sets the rest of the iD application's launch state.

There is no resume code. Every write to a write-only control reaches
the device, so alsactl restore also repairs a device that was reset.
The state across a suspend depends on the power source:
- On USB bus power, a system suspend re-enumerates the device.
- With its mains adapter connected, the device keeps its state across a
  system suspend. This is also true when the host controller resets the
  device and the card stays. The sampled readable controls did not
  change.
- A runtime suspend left the readable controls unchanged on both power
  sources, with no reset logged. A runtime suspend is possible only
  after usbhid releases the HID interface.

Patch 5 replaces the generic "Monitor Mix Playback Volume" (FU 12) with
one of the same name, count and range. FU 12 GET CUR returns stale data
from other units. Its Main L channel ignores writes, but Main R applies
them. audient_id14_map already notes this asymmetry. The new control
holds Main at 0 dB. This is a deliberate change for existing users: a
Main R attenuation set through the generic control no longer applies.

The protocol comes from Audient's iD application (version 4.4.5 for
macOS). USB captures of the application confirmed it.

Test setup:
- iD14 MkI, firmware 1.1.1
- Bazzite 44, kernel 7.2.9-ogc3.1.fc44
- snd-usb-audio built out of tree from the v7.2.9 sound/usb sources
  with this series applied

Tests:
- listening tests: routing, dim, talkback, Cue
- a loopback cable: gain boost, polarity, FU 12 per channel
- alsactl store and restore across a replug
- an out-of-list routing value
- a runtime suspend
- three system suspends (S3) with control reads running at about 3000
  per second: no read failed after a resume
- the optical power-on mode, read on macOS 27.0.1 with no Audient
  software running

The series is based on sound for-next a4ef328ce3b3. Each patch builds
on its own there with make W=1 sound/usb/. The hardware tests used the
complete series on 7.2.9 sources, where snd_usb_mixer_add_list() has no
look_for_empty argument. The series passes true, which keeps that
behaviour.

Will Porter (5):
  ALSA: usb-audio: Give the Audient iD14 MkI its own mixer map
  ALSA: usb-audio: Add Audient iD14 MkI monitor and routing controls
  ALSA: usb-audio: Add Audient iD14 MkI mixer matrix
  ALSA: usb-audio: Add Audient iD14 MkI write-only controls
  ALSA: usb-audio: Replace the Audient iD14 MkI FU 12 control

 sound/usb/Makefile           |   1 +
 sound/usb/mixer_audient_id.c | 790 +++++++++++++++++++++++++++++++++++
 sound/usb/mixer_audient_id.h |   7 +
 sound/usb/mixer_maps.c       |  10 +-
 sound/usb/mixer_quirks.c     |   4 +
 5 files changed, 811 insertions(+), 1 deletion(-)
 create mode 100644 sound/usb/mixer_audient_id.c
 create mode 100644 sound/usb/mixer_audient_id.h


base-commit: a4ef328ce3b3ab1bf63c6350e890f13b9b25e3f1
-- 
2.47.3

