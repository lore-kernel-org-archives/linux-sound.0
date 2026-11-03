Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712391;
	b=4hShi06J0325QIwG58829iY4PvsBg74ivcCen6Ls72VwvPj4AL7IuxqNRJlX6lNtyTKt
	 zywjoqAG6zzG1eJr2mRsCgGQ8+oE6Fmy9JEXqCiDxlqkRM7KoAorxmVF2S0X/vRxVm5hX
	 lbZyHs8WNnu1ANTpJRDnOaTOkx1MlZ7CmdLo+HQ7Bn6u/ta7NKSCtkzhwIczr8/mdOZTa
	 Aot/vRsXtlw8Q2iEFZGL/ewzZL7HOmh9NB87cHWoZs7ky6WuMRtVxRhoW3o1AGisBPyNO
	 JwNcFCg9DsSXJJCK8oxdwhznEI5q+RbqnC86L1B+0YOoigDwFyQTluMLwkIPfsx8bHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712391;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MhrAohROuoQvW/+FZhf5A3y/lmXdouABbjHKc2GoqJA=;
	b=JaVZlU4D09JMm1fZkGX6q8JDeTTuWdeGfoyzCNUsohTsnRyJ0tGSiY7NXXI5R7TjZh3/
	 YRjVgNWCP8YIo4/GDhkfxscpneddqQxopVkYNdctQZFkBoySQyZhth3aw16AcAXV8Gea0
	 d6N8G7uWZlH5xvMMcn9T3PWomYX8wdMenSjUyGOI4DL4SUFZdV+mLjti+0nTAsPdTeUCl
	 1illK9jFJOX9gr8ay2/YI6v0DPxoq6zNjUR2TKKYC2MiFNznB3utLHXHJfDekJ0sekpl6
	 d6Upo54QUyokceWdxj/OvruNSJbXBjIUBnyCBHvdJkl8t7pmt5cU62aPPZ6Z5FuaNfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IpLEiELT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C340C606A334
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 13:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IpLEiELT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41BF31F0093A;
	Tue,  3 Nov 2026 13:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793712390;
	bh=MhrAohROuoQvW/+FZhf5A3y/lmXdouABbjHKc2GoqJA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IpLEiELTS2BVI2vTULVMKqptx21P+XpTo8nhueIG3Mlra3q/G7WTgmC5zbuzjddci
	 GCnRONWjo4fP2ZuGHkjIKcBFjODRl2XbIZO88P8Tc1JMdLoSwxx7JKKNR0291c9vgx
	 5LWslr7J4A18wQe5OY9AkDWapsfg1bmcDEjjgUIR1rM6sm5sKfJm5vp5t8dB7Ol1jQ
	 JejRIV5Vx6mKPEfGViginTY+uLptufZpM780P+8wXvivHnAOGZVi2h7gZTu0lUgwTJ
	 CgOkGfsuG/Hk5mBhlMbEwXxduDuIV8LK+K3o2zjriF+HuALytbH3PWTtrazHrYgNgm
	 T6i8KrtmPJmmA==
Message-ID: <sashiko-outbox-195340@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ASoC: amd: acp: Add support for more projects on
 ACP7.0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Baojun Xu" <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261103131755.1558-1-baojun.xu@ti.com>
References: <20261103131755.1558-1-baojun.xu@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 13:26:29 +0000
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
- [Medium] ASoC: amd: acp: commit message claims ACPI match entries for DMI=
 table change
--

commit fa5635df62bd36367cf6a3d7f3a836d806c320e3
Author: Baojun Xu <baojun.xu@ti.com>

ASoC: amd: acp: Add support for more projects on ACP7.0

This commit adds five HP board DMI match entries to
acp70_acpi_flag_override_table in sound/soc/amd/acp-config.c.

>     ASoC: amd: acp: Add support for more projects on ACP7.0
>    =20
>     Add ACPI match table entries to support additional projects using the
>     TAS2783 codec on the ACP7.0 platform.
>    =20
>     Signed-off-by: Baojun Xu <baojun.xu@ti.com>

[Severity: Medium]
This isn't a bug in the code, but is this commit message accurate after the
v2 changes?

All of the ACPI SoundWire match table entries appear to have been dropped in
v2, and the patch now only adds five HP DMI board entries (8EF5, 8F6D, 8FA4,
8FA5, and 9056) to acp70_acpi_flag_override_table in
sound/soc/amd/acp-config.c.

In snd_amd_acp_find_config(), acp70_acpi_flag_override_table is checked via
dmi_check_system() to bypass snd_amd_acp_acpi_find_config() and return 0:

sound/soc/amd/acp-config.c:snd_amd_acp_find_config() {
	...
	else if (pci->revision >=3D ACP_7_0_REV) {
		if (dmi_check_system(acp70_acpi_flag_override_table))
			return 0;
		return snd_amd_acp_acpi_find_config(pci);
	}
	...
}

Should the commit message be updated to describe adding DMI flag-override
entries to acp70_acpi_flag_override_table for these HP boards and explain w=
hy
the BIOS acp-audio-config-flag ACPI property needs to be overridden on these
systems?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103131755.1558=
-1-baojun.xu@ti.com?part=3D1
