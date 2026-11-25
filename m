Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795586525;
	b=0cAB9zqTy9yvUzLYRQVdoQJwV+Xd/uC7eAKF/gsJYI5xYWitiR0Zf+FnnFuTz4FDwnKp
	 Dmb+waK8pxsd6O1jiMG2esJmMEFITLkDbMHXNhoWNsZ/oVLkIT+mNis4h9MvaW1tuOM4z
	 P/Vrd1xlqMijqEmVpue/lTLe7mtSymvt3aHYN8nKIYzeRKFgwaBAAkM+yoVgE+K8fF3qq
	 diRYvkUPBwr4zMwgNpboFF9lWvD/1Ma/8/gBufaa0bWSeNPDsdbsQ4ymTUdrOD+ccRSCu
	 abtqAMp/tPWKrCJaHxA6pT3D+YrU7H3kfjzCV2OC3Kcqrp7zyE/n3zPFOEtKdtfN+gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795586525;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pwRvvuNn17XZzPbKQLky2ZVq4tEBZfTLQvc35YgeW7w=;
	b=dbD+Wb7Xi2K6I4DpLFo4f8OyyPvdc+6sVZY2guZAm0aHnld+9Do6enm5VRnP42Cy6QUK
	 Jd7AtigjLoTZrnm1Ua/+04XUQUM7k0RuV+lGO3tvxVHtUh9v6mEBKv6wwuts11jS8xL8e
	 DH+OETU69O1XET5FxqZpS/2noQ55bW71rcLSByiEJ8mJBiMvC7ftNfwyqEYOOq4xMr6Gz
	 f8lDc9gy7N9gcZ2mEZLDtSF7O3S8cKMEsmnyj5i1cinpS6/wy4uxyMX15n+fObYqpf4YA
	 McctryofkOPw2tuIfL0EGT5YeUmi7fPx73Ou9XKTSYuQJtFEMw75d/Aqj0r+zMU/5Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h1Ni4axS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0E4606A329
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 06:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h1Ni4axS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3917A1F0093E;
	Wed, 25 Nov 2026 06:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795586525;
	bh=pwRvvuNn17XZzPbKQLky2ZVq4tEBZfTLQvc35YgeW7w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h1Ni4axSb4TuCgzUPfmEd3jobhF3GKpEqA9w1oYtcscPNahvdU3d8tpL3A38Fj6Jq
	 5NzCd1TN4gozpU1XMmh3+aARzzKQ96cHEfrzbkaxs67/1DspCHk3SseKU3rJFedy3D
	 atDUe5jvp8bmBTQT8+oFeRUYpJqZN/URb6xe824AlZdCy31jlcdjQwKubDQGploTTs
	 FksrsLZ9gM/iobrv22Om3dJjpeR6GsVgp3uvqAszMlIwPHcW/+RkEEdLrelsLla3XV
	 8tU8I+C/SiueUlOoBaIJdv8MXMNSWpugZZR0I1tXvA4X+F28DS8yBjQSX0DuhFTUR5
	 79rYjQIycaU3g==
Message-ID: <sashiko-outbox-232637@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ASoC: SOF: amd: acp7x: reload firmware from disk on
 S4 resume
Reply-To: sashiko-reviews@lists.linux.dev
To: sravisar@amd.com
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261125053843.1611378-3-sravisar@amd.com>
References: <20261125053843.1611378-1-sravisar@amd.com>
 <20261125053843.1611378-3-sravisar@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 06:02:04 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] ASoC: SOF: amd: S4 carveout reset bypassed in
  amd_sof_acp7x_resume()
- [Medium] ASoC: SOF: amd: missed carveout clear in
  amd_sof_acp7x_resume() after FW crash
--

commit b8704d96ab1f4418fdf040e05ffe9e060f0a776b
Author: Siva Subramanian Ravi Saravanan <sravisar@amd.com>

ASoC: SOF: amd: acp7x: reload firmware from disk on S4 resume

This commit clears fw_code_carveout_addr on S4 resume in
amd_sof_acp7x_resume() so acp7x_load_firmware_carveout() reloads and
re-validates the firmware into the ASP carveout after hibernation.

> diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
> index 0d208df621e29..4ad54e5b4f660 100644
> --- a/sound/soc/sof/amd/acp.c
> +++ b/sound/soc/sof/amd/acp.c
> @@ -1672,6 +1672,15 @@ int amd_sof_acp7x_resume(struct snd_sof_dev *sdev)
>  		return ret;
>  	}
> =20
> +	/*
> +	 * S4 powers down the carveout, invalidating its cached firmware. Clear
> +	 * fw_code_carveout_addr to force a full reload via VALIDATE_IMAGE on
> +	 * resume instead of a SHA-DMA from the stale carveout.
> +	 */
> +	if (acp_data->asp_carveout_base &&
> +	    sdev->system_suspend_target =3D=3D SOF_SUSPEND_S4)
> +		acp_data->fw_code_carveout_addr =3D 0;

[Severity: High]
Does placing this check at the end of amd_sof_acp7x_resume() leave
acp_data->fw_code_carveout_addr set when acp_data->sdw_en_stat is true?

When SoundWire managers suspend in clock-stop mode,
amd_sof_acp7x_suspend() sets acp_data->sdw_en_stat via
check_acp_sdw_enable_status(), causing amd_sof_acp7x_resume() to return
early:

sound/soc/sof/amd/acp.c:amd_sof_acp7x_resume() {
	...
	if (acp_data->sdw_en_stat) {
		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP7X_ZSC_DSP_CTRL, 0);
		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP7X_PME_EN, 1);
		return acp_dsp_reset(sdev);
	}
	...
}

sof_resume() still calls snd_sof_boot_dsp_firmware() afterwards, so on S4
resume acp7x_load_firmware_carveout() will skip VALIDATE_IMAGE and
SHA-DMA from the unpopulated carveout.  Similarly, if acp_init() or
acp_memory_init() fails before reaching this check, snd_sof_complete()
resets sdev->system_suspend_target to SOF_SUSPEND_NONE without clearing
fw_code_carveout_addr.

[Severity: Medium]
Can acp_data->fw_code_carveout_addr also remain set on S4 resume if the
system hibernates while sdev->fw_state is SOF_FW_CRASHED or
SOF_FW_BOOT_FAILED?

In snd_sof_prepare(), sdev->system_suspend_target is initialized to
SOF_SUSPEND_S3 and the function returns early before querying
acpi_target_system_state() when sdev->fw_state is SOF_FW_CRASHED or
SOF_FW_BOOT_FAILED:

sound/soc/sof/pm.c:snd_sof_prepare() {
	...
	/* default to S3 in case the followingaske fails */
	sdev->system_suspend_target =3D SOF_SUSPEND_S3;

	if (sdev->fw_state =3D=3D SOF_FW_CRASHED ||
	    sdev->fw_state =3D=3D SOF_FW_BOOT_FAILED)
		return 0;
	...
}

sof_suspend() then resets sdev->fw_state to SOF_FW_BOOT_NOT_STARTED
after snd_sof_dsp_suspend() returns, so on S4 resume
sdev->system_suspend_target is still SOF_SUSPEND_S3 and
acp7x_load_firmware_carveout() will SHA-DMA from the powered-down
carveout.  Clearing fw_code_carveout_addr in amd_sof_acp7x_suspend()
when sdev->system_suspend_target > SOF_SUSPEND_S3 or sdev->fw_state is
SOF_FW_CRASHED or SOF_FW_BOOT_FAILED would avoid both issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125053843.1611=
378-1-sravisar@amd.com?part=3D2
