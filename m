Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674376;
	b=xueXxIymIkkpBkHRqVPvQj0yLaLYXLyqKYGNi1z9RsSmIsoKHRIRYFFcurQu45KSkfo7
	 vnsBOV/ggb+eqTahH/uB/maZYnfe8IMEdJgBhb69FCH54mDE9u/pFWYGs1abd4AE6dZQH
	 Nt4oXtwLdCFkwG8IvXED8yQcNd0CzdSpTRYwgUsp3Yr7GoEqZ/xevmZq8oJpJpLfPzyHa
	 M4DXEePtMQUyx4OKGcJAiG6otX7hY3oojM/E+VUcAiMuFv8Aqv9DoxcOBGaCx1mSGqL7v
	 qBGDG5HO/o9992W5gd2Fs97PyuRXtDb2/bmX/2eCTmPnMKPdYuhxRxGReaA4yqInDFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674376;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1kc6T4c+omsWqB7nlkqTXG3rA4wKDaS+OYAxeQFci9A=;
	b=fh9NIBx7gA/RkFJPEPgXxWpOEfSC1+8ElMx+ZHEd94r+DkLWWf2foy1BwTferLTBs7M5
	 Ik0vFQtOcL5lxSVz6q9upO4nEfUQoLTg3PiQWis/Tcs8HMGFi4oXAWJdlkEx2OPgdfrDZ
	 BFWb7l8uFWRLVx5NrvBYy0AegjvWRbfmPvW+ADSZhNS4u13rn+USz4cejfdfdxpI9vXna
	 EdoAn64AvsohFOuZxra//D1kdKdlj0uQnHGwod+bL+xIZq/G0bW1yoHlPL6NEZI/vmLzU
	 1CXACGrpnNU0Je20n5XJxQAff5fmo6TpKERTrkMxwIE8qlpMfFYnMT47YaNA1JLsFSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AsFztf7F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8E3606A31C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 06:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AsFztf7F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D86401F000C0;
	Thu, 26 Nov 2026 06:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795674376;
	bh=1kc6T4c+omsWqB7nlkqTXG3rA4wKDaS+OYAxeQFci9A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AsFztf7F3lBSG0oOsN0/s1Vb211VIIWhFBCXEJjt19CH9ZWb1JDObbw06ecKnMKKO
	 yaHxTUPAaDNN+dkKz+EVBQoDsKro9eW8AfFy1hZrmWNNa9Wm5i+LpARzzYuw2MO4vZ
	 4n2DA+eBddktctJ8e3KD557G2v3YVUArfvjLbyDDSjiOtpp7lzV4leF+s8NODhOUxH
	 y9Vqno4VV15cCz840m1WNrkjGmZA43+0TtLeVxIFYEuyftf4SiFggHcAR6Nr1fb2r5
	 eGhoecCsUYfwA34ave0XjTsp+IPI2squNMrHislsEehNpfZ8otKY14qfnxU6EWIhve
	 2NACOTrJ6afXQ==
Message-ID: <sashiko-outbox-234841@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: vmaster: Restore follower values on put failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeraj S Kurup" <sreekuttan2156239@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261126061910.2840-1-sreekuttan2156239@gmail.com>
References: <20261126061910.2840-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 06:26:15 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ALSA: vmaster: missing Fixes: trailer for follower_put() cache
  rollback
--

commit e512ea23a89880847ea3256140a6153982f9af47
Author: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

> ALSA: vmaster: Restore follower values on put failure
>
> Restore the cached follower values when the underlying put
> callback fails.
>
> Otherwise, a retry with the same value may be skipped
> because the cache already contains the requested value.
>
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

[Severity: Low]
This fixes a bug in follower_put() where cached values are updated before
follower_put_val() is called and not restored on failure.  Should this
include:

  Fixes: 3b0a5f22d464 ("[ALSA] Add virtual master control helpers")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126061910.2840=
-1-sreekuttan2156239@gmail.com?part=3D1
