Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760163;
	b=nGa9Je+RmwiGIIW4UVIbvd9275wyqqeEHNX1Q9BYba5LyAfAKKtENdBAoeskt0Q7V9N7
	 V5AxGkqVFpy+LMgvRVc4nWdaoX0NFFn3AxW7UutNqOxYZwCvWDNFd5Sr62IDO+dujJvFf
	 0pGjSyvV9N9im5QVYuq7qTfw7s07PqNqa+I0WtafLnyt86iT1iOJ0I6M3YTgBt84iUdxd
	 qxErQNztGVYJAgtNRrT1QWAm5VDCIDZrQZo6Ar4pJMbJBpmMV1fpK1hf8vMmq6dBJUi5R
	 n3kWGRMdEReL0abcZl8cvFZVAXcJWXpuyKH8Hl63d0rGFIcm+Japp/99V1Kxn7acs3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760163;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7Y8wZY/M66n3HuHnMcr2OpiKj/rvo4pX4K9g1fZaXzU=;
	b=X1HJoT1+S7ovc6EXuNJiCiQkpyz5FOp5ldmyrAdbJ4NzERKNTE3NVm0RskHA77jdjvWT
	 lV9jqPk+nUHifPaPQq/BA5/AbkdM/MlQuESZ8kwcGtl8AMkbVLVtK2FslV7K+fZvYIeP/
	 DXFVKL5E7Qog+UKTh1bnpyM9gqIODySYuiLbBqvN0eLYaKJ3nvNIaksDysrx+k9cNU1Ub
	 l9KVdippD9hCuzsRX6CjBDOTAoLbr5LENpF5RTdA1U8ef4PhPCisiRbBFL4DcpcEHpEn1
	 CaC1hnJB633lSTRKsibPQVPVP00DbaHuX4IUNAzm02/xcFDwYqhSlvTqm3wDU57EIow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l+M25UwI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029C4606A332
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 02:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l+M25UwI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D881F000C1;
	Wed,  4 Nov 2026 02:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793760162;
	bh=7Y8wZY/M66n3HuHnMcr2OpiKj/rvo4pX4K9g1fZaXzU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l+M25UwINxqB4ZZKFaX08f1mYP32hVAi4/UHoIglTlaPSW682GcJWSOgbXBaluC5T
	 a7A4liQXx2NeFDJeLfFsu2OZrKVvMFhauIcySAfrTMHmbST0TWgzz/gGjFf1OBm5J9
	 NEatJ3o54tiqgu9fZ8a2XT5eGZNsK+vUBS2gsUQmKUq3Xzt6w2IbD+XyN3TTChHWj5
	 BymohS7JqNQaCbEL3blitXW6YXKOP/WD/IK0b0yD6bafEiK9MCk87PX8Kz2aq4GyvL
	 1W+p6m0scdVfs7J3wfbizHJg1rnbqrT4IaiYyAiZK0Eka8NnUPCf2FqbihrWHy0MvM
	 4NG8lRo5Gk9pA==
Message-ID: <sashiko-outbox-196515@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: codecs: madera: release runtime PM ref on FLL
 config failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261104022814.1484284-1-vulab@iscas.ac.cn>
References: <20261104022814.1484284-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 02:42:41 +0000
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
- [High] ASoC: madera: broken error handling and return value in madera_fll=
hj_enable()
--

commit 0527a87963a29c49669e1565c1faf7d3cc1ad756
Author: Wentao Liang <vulab@iscas.ac.cn>

ASoC: codecs: madera: release runtime PM ref on FLL config failure

This commit releases the runtime PM reference and skips waiting for FLL lock
when madera_fllhj_apply() fails in madera_fllhj_enable() while the FLL was
previously disabled.

> diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
> index 58255844b4df3..2f6256f8e87b2 100644
> --- a/sound/soc/codecs/madera.c
> +++ b/sound/soc/codecs/madera.c
> @@ -4608,8 +4608,17 @@ static int madera_fllhj_enable(struct madera_fll *=
fll)
>  			   MADERA_FLL1_HOLD_MASK,
>  			   0);
> =20
> -	if (!already_enabled)
> -		madera_wait_for_fll(fll, true);
> +	/*
> +	 * If configuring the FLL failed it is left disabled, so a later
> +	 * madera_fllhj_disable() will not see the ENA bit set and will not
> +	 * drop the runtime PM reference taken above.
> +	 */
> +	if (!already_enabled) {
> +		if (ret)
> +			pm_runtime_put_autosuspend(madera->dev);
> +		else
> +			madera_wait_for_fll(fll, true);
> +	}
> =20
>  	return 0;
>  }

[Severity: High]
When madera_fllhj_apply() fails in sound/soc/codecs/madera.c, execution
jumps to the out label before calling pm_runtime_put_autosuspend() and
returning:

sound/soc/codecs/madera.c:madera_fllhj_enable() {
	...
	ret =3D madera_fllhj_apply(fll, fll->ref_freq);
	if (ret) {
		madera_fll_err(fll, "Failed to set FLL: %d\n", ret);
		goto out;
	}
	...
out:
	regmap_update_bits(madera->regmap,
			   fll->base + MADERA_FLL_CONTROL_11_OFFS,
			   MADERA_FLL1_LOCKDET_MASK,
			   MADERA_FLL1_LOCKDET_MASK);

	regmap_update_bits(madera->regmap,
			   fll->base + MADERA_FLL_CONTROL_2_OFFS,
			   MADERA_FLL1_CTRL_UPD_MASK,
			   MADERA_FLL1_CTRL_UPD_MASK);

	/* Release the hold so that flln locks to external frequency */
	regmap_update_bits(madera->regmap,
			   fll->base + MADERA_FLL_CONTROL_1_OFFS,
			   MADERA_FLL1_HOLD_MASK,
			   0);
}

As documented in madera_fllhj_disable(), a disabled FLL requires
MADERA_FLL1_LOCKDET_MASK =3D 0, MADERA_FLL1_HOLD_MASK =3D 1, and
MADERA_FLL1_CTRL_UPD_MASK =3D 0 across runtime suspend and resume so that
regcache_sync() does not latch CTRL_UPD before writing out all FLL
registers:

sound/soc/codecs/madera.c:madera_fllhj_disable() {
	...
	/* ctrl_up gates the writes to all the fll's registers, setting it to 0
	 * here ensures that after a runtime suspend/resume cycle when one
	 * enables the fll then ctrl_up is the last bit that is configured
	 * by the fll enable code rather than the cache sync operation which
	 * would have updated it much earlier before writing out all fll
	 * registers
	 */
	regmap_update_bits(madera->regmap,
			   fll->base + MADERA_FLL_CONTROL_2_OFFS,
			   MADERA_FLL1_CTRL_UPD_MASK, 0);
}

Does dropping the runtime PM reference at the end of madera_fllhj_enable()
allow the device to runtime-suspend while MADERA_FLL1_CTRL_UPD_MASK =3D 1,
MADERA_FLL1_LOCKDET_MASK =3D 1, and MADERA_FLL1_HOLD_MASK =3D 0 remain set =
in
the regcache for a disabled FLL?

Additionally, madera_fllhj_enable() still returns 0 instead of ret at the
end of the function. Because cs47l92_set_fll() -> madera_fllhj_set_refclk()
stores fll->fout before calling madera_fllhj_enable():

sound/soc/codecs/madera.c:madera_fllhj_set_refclk() {
	...
	fll->ref_src =3D source;
	fll->ref_freq =3D fin;
	fll->fout =3D fout;

	if (fout)
		ret =3D madera_fllhj_enable(fll);
	else
		madera_fllhj_disable(fll);

	return ret;
}

shouldn't madera_fllhj_enable() avoid setting LOCKDET/CTRL_UPD or clearing
HOLD on error and return ret so the caller does not see success with
fll->fout left non-zero while the FLL hardware is disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104022814.1484=
284-1-vulab@iscas.ac.cn?part=3D1
