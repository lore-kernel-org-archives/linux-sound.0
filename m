Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668612;
	b=OVNGLw7qu6/KOgeXBc8G0keframjZRWO5dHKFzL3yed9N9WsBzpLxWGBj/JxAaqU94lc
	 aKz4tXMh5PUpMTmMq73uoA0MO43YBw1yOhjLXzd6jkG8iqhLt8rHbjhhiVNzRXr/WbB9o
	 reIbp2Ax2dRvBMhh5XIfgi8O+JvSuzi863bOSzLz3gzglyHdW3zdKG5vOBISH0U6ZhYTX
	 O2I5FJiGNS2oOgwKBseFPR5RuplClhkufJuNv9Ol19oio2eJPC/EDOIhY4rCM1xY5DXVU
	 Y8mdTRviTKzReSLmqTgd7hxPMhL90NygDpwmjymOS7ktr0RM3oeZbEz0e05po6mGQgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668612;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TvcN6yl+qAP5UQK/ZdlXxlHzvITbqN39g5E+t8qJow8=;
	b=eH3/GfbsAkdTwycUj+AESyNZ1fQkpCBTGetFkCFGxQiSampDadoQBojB9/PQ/rPLw9Ke
	 e/gIRSO/BUxyQlKsgzHdkbNnCZnaV7Y5GB3u6dvPPiCfNqq21cwhEdd+xsDpxBP+vLWmi
	 U5+Y0rkGglD3JSLJgf1EMDABekIU+4iRczeu9er9KJ5vV1vuxgRa5DemGfRPYsCDBx5oA
	 LTI4HRvfZfZRtuxNJmCS5u6tQF4VFVViZ8RhrXAkRWyHx1elKSWneiZO6HW4p9ie7K1TX
	 Y7XPLezsUbJi7+qXXc8NNA6PDuoGQk+E725jE1KZ3MnZnqhVwI1HgM5Miq/a10ryKMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iaqtW4Y9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0455606A326
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 01:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iaqtW4Y9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5CF1F000C1;
	Tue,  3 Nov 2026 01:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793668611;
	bh=TvcN6yl+qAP5UQK/ZdlXxlHzvITbqN39g5E+t8qJow8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iaqtW4Y9Zvolu0GECpl8gdVTSwzD/AX9TkYjvy79LIVO15iH0cVCCYhkOFraoQZ86
	 +KigASMCrBo4eBIWPwUftDrstpgWBguMEZduMMix/aSuRuwZbY2d9lWBIq11mQ7YsN
	 jb4UHwm3JmoKgHVFy3TS/JIdxn2ACL5ri37bLHKu1edhEVFe7rUQFdJqXKLnf5ROaj
	 Lh7W2wdY6W7KFhH0Re9ezn4JIXfUYiJTNmA+27LuHcOL7lwfxeCYa2ISrpXqx4bUD5
	 AuLm3M7PAn2+AZ/T1kluKDuWnUKbBhbZKGcg5uw+wkbGilrZ5jGpk9R09NNnSKb3vc
	 XMTdN4MPMNZWw==
Message-ID: <sashiko-outbox-194420@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] ALSA: pcmtest: Add a volume control with event
 fault injection
Reply-To: sashiko-reviews@lists.linux.dev
To: "HyeongJun An" <sammiee5311@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261103011000.1012035-1-sammiee5311@gmail.com>
References: <20261103011000.1012035-1-sammiee5311@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 01:16:50 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] ALSA: pcmtest: missing documentation for new control fault module p=
arameters
--

commit 37a7a575ca0b14787e4948616e5cc636a185dad2
Author: HyeongJun An <sammiee5311@gmail.com>

ALSA: pcmtest: Add a volume control with event fault injection

This commit adds a stereo playback volume mixer control to the virtual pcmt=
est
driver along with two module parameters, inject_ctl_no_event and
inject_ctl_spurious_event, to inject event reporting faults in
snd_pcmtst_volume_put().

> diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
> index 66bee8a2ce343..c95bb47174871 100644
> --- a/sound/drivers/pcmtest.c
> +++ b/sound/drivers/pcmtest.c

[ ... ]

> @@ -109,11 +114,17 @@ module_param(inject_trigger_err, bool, 0600);
>  MODULE_PARM_DESC(inject_trigger_err, "Inject EINVAL error in the 'trigge=
r' callback");
>  module_param(inject_open_err, bool, 0600);
>  MODULE_PARM_DESC(inject_open_err, "Inject EBUSY error in the 'open' call=
back");
> +module_param(inject_ctl_no_event, bool, 0600);
> +MODULE_PARM_DESC(inject_ctl_no_event, "Report no change from the control=
 'put' callback");
> +module_param(inject_ctl_spurious_event, bool, 0600);
> +MODULE_PARM_DESC(inject_ctl_spurious_event, "Report a change from the co=
ntrol 'put' callback");

[Severity: Low]
Since inject_ctl_no_event and inject_ctl_spurious_event are registered via
module_param() in sound/drivers/pcmtest.c and can be passed on the kernel
command line at boot (as snd_pcmtest.inject_ctl_no_event=3D and
snd_pcmtest.inject_ctl_spurious_event=3D) or set via sysfs, should these new
parameters be documented in Documentation/admin-guide/kernel-parameters.txt
and under the Configuration and Errors injection sections of
Documentation/sound/cards/pcmtest.rst in this patch?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103011000.1012=
035-1-sammiee5311@gmail.com?part=3D1
