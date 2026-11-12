Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511714;
	b=gjPSAPpnpukib/4eYt6AVNOtiwyoSo0Qm7YewYScEyuw1JSd5jmXmP1GTEuwJib0pRfe
	 ScvSpRPK2ZmVmRVFI7AMn58KfcvYcsZ0E35Ulx/KKVaogbSEudA1Hul7Ti9O/9mLmLNjQ
	 aaigDoIK9V07tPz4l2sTHeS3RY8BGtHXw5p9UQ4Eu004/q5ZPU94xzqDRe2GKu8Pa/1J/
	 J8y5zchDtUp4OeOZml0seLU3RlzV4ILJDpJNItgj5DkLwjf9T2IQYssWnuM/fswx9IsUl
	 n7hnOQYdUh/D3Ojq3ISE3EqRfrUqB/WA+AEbzslM77D1NoAPOHsoj2M5sbPXrkj0voQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511714;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dMxt564Um2nefopMM9DQYWiDff1Q0zXN+T8vZtPG8cw=;
	b=TEHjjsQY0djwapizGedrk+g4wFPQ4V3/6SAzgU6VKsnpo5WvjbgyCYOaphNP70ztRbnh
	 V9gozpBF2CRpYMFShQetPDdgc5/fZjAarEw1PxBlzceT8lMxQTWGUIKaSzirSFau4auXa
	 fE3TZISnkFfRXAsutnWkHkE/Xe+4PsAY+bVXTsfuVyTXdCPKeo0wlQXR5lW+hGGk6/kyp
	 bqztImNS9ugeYSF1QgB9W/bTtGXI59E2jgftnEz8g7bPYSsm2k3zvtXxC+fZ5M6nQ2gkT
	 Yk7+7WhVanEFjwbeQBbZ5wD3GV6cEq+sETUZPkbRRPeEtWJ8hF4KYYprLQuemINOkSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gsOylOJC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A408606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 19:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gsOylOJC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124B71F000C4;
	Thu, 12 Nov 2026 19:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794511714;
	bh=dMxt564Um2nefopMM9DQYWiDff1Q0zXN+T8vZtPG8cw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gsOylOJC99tFR9RviDp9ekPJaQ2AD0uK3BzOZdVmadR0yEH/NiB/aAugYTNtWg0Zo
	 d8BM0pjFjcdP9CNt+mc1RLq2m1FnOwq57nsZDLacExNuZJywWi+Q0OIFZg5E/tMJ2v
	 tglmG7FtB/Tq7oNj0W+99n7UYyOBjyN6/2c9QmKXqZXgkUHyummww2rpGiDOi/mzIr
	 8/RbeYMbFXokb8cgnXoBldE7dImAJLi/4yNPS+hMWOAAFT2jowkJCN2457UBs8DgkB
	 VzS1LZgmWX2DcLhceM75mdW7F6etgQ/W9Y8sEFEDnYk/ZYj7xoLJJ3NfmCyu+VFZaE
	 X9Dt4GFThNm5w==
Message-ID: <sashiko-outbox-211764@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RESEND PATCH 1/3] ASoC: codecs: lpass: Discard
 pm_runtime_put_autosuspend() return values
Reply-To: sashiko-reviews@lists.linux.dev
To: "Brian Norris" <briannorris@chromium.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261112111937.RESEND.1.I5cd238b1d4516d4d6980565e0a4e1b83d9abce63@changeid>
References: <20261112111937.RESEND.1.I5cd238b1d4516d4d6980565e0a4e1b83d9abce63@changeid>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 19:28:33 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Medium] ASoC: codecs: lpass-rx-macro: missing probe deferral in
  rx_macro_probe() [1]
--

commit 0df95183a384e1e17bae628755bf6ae48d5ffec1
Author: Brian Norris <briannorris@chromium.org>

ASoC: codecs: lpass: Discard pm_runtime_put_autosuspend() return values

This commit drops error checks and warning messages on the return value of
pm_runtime_put_autosuspend() across the LPASS macro codec drivers.

> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-r=
x-macro.c
> index ab8a1c2b0489b..c703275fc4429 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -3919,9 +3919,7 @@ static int rx_macro_probe(struct platform_device *p=
dev)
>  	if (ret)
>  		goto err_rpm_put;
> =20
> -	ret =3D pm_runtime_put_autosuspend(dev);
> -	if (ret < 0)
> -		dev_warn(dev, "runtime PM put failed after probe: %d\n", ret);
> +	pm_runtime_put_autosuspend(dev);
> =20
>  	return 0;
> =20

[Severity: Medium]
This problem wasn't introduced by this patch, but can rx_macro_probe() fail
permanently [1] when it runs before the lpass-va-macro driver has
probed?

sound/soc/codecs/lpass-rx-macro.c:rx_macro_probe() {
	...
	rx->codec_version =3D lpass_macro_get_codec_version();
	...
	switch (rx->codec_version) {
	...
	default:
		dev_err(dev, "Unsupported Codec version (%d)\n", rx->codec_version);
		return -EINVAL;
	}
	...
}

Until va_macro_probe() sets the codec version, lpass_macro_get_codec_versio=
n()
returns LPASS_CODEC_VERSION_UNKNOWN (0).  Returning -EINVAL instead of
-EPROBE_DEFER causes the driver core to abandon probing rather than retrying
once the VA macro driver probes, breaking audio playback.

[1] https://sashiko.dev/#/bug/linux-263ddc0b-b9b3-4b30-bcac-0a188381f702

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112111937.RESE=
ND.1.I5cd238b1d4516d4d6980565e0a4e1b83d9abce63@changeid?part=3D1
