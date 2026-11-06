Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984571;
	b=27f8qSU5MCEtTsrpOPOHA3c791xPtUtRbiapAieBH7OIeOkW1UpyHfBQhEam6uDRjBa7
	 K/qezMQivDrO5CogPUdpgWtsh7vZzjORos15YMdHU6a3xHw9TEKA0+To3d4AX0oN9DCvB
	 OmOfhbBiU/nVzyYO75XptmOcJ+kmP7ZSgFhAjFna7J0Fbn8iSAugriY93M33dl3rWJhn2
	 vUXzmjvTGKxys1Lqh/PeGIPCnlzRqgsJ5uZFNS/a5efWXLC+LqeBjOwl5Eny550m796sq
	 E6yduCv3mERdiEgsgYxbl/457rxyXSerOUuBLBIF8HBbn+lVzOE4Ue3o0OjJebDX3hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984571;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=94CmBBw3NWGMuAZJtu32Mlc4waHDMvieX2nGYsNMr5c=;
	b=QCqq8az76iTOjxX+lf4XQrgXP/zEBYfx2cYobcVqHlqAveO1ptinoQI8CNXVrIY/AVpS
	 rIwgQm5SVX/+odUzRq4W0m+GVGSxOi/0vYblQ//yHazeDl3rnTAOhclamMb5m5IQ9Q1VI
	 BGxHtC/07GxRuhjApZ7AVlEuUFwHElM/EuiHc3F4RZzAga1roe0dREu+HVajRq3PmHtvm
	 WJSyJXcLdvu/KfQe9XIZqXPqzmPB+FXTdJdV8suPV1gbd+V2rLS2sWld49rWYNlMqrbfn
	 8nZwvhZ1dlLqcNv0CMhvOWu4SMBY47xkhfGIhbMcXCumh5vUOHuMDEdg7GEQSzEAfmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bdAGrYQG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056C1606A326
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 17:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bdAGrYQG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD0C1F008A1;
	Fri,  6 Nov 2026 17:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793984570;
	bh=94CmBBw3NWGMuAZJtu32Mlc4waHDMvieX2nGYsNMr5c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bdAGrYQG2CXYTiC0G2iLI3YeUhUIMVA5cColAXXvRxXLXvADg8oUzCZgjJgR8y9r2
	 WFUdtlDHdh1uAOaw+S7VsRYML2eKaxiPG3A9mKHQKypMDwV/305Nmy6Xb6Mtqsn+sg
	 nXfxINVLCVqQI7QlsbqSBcqmtevIT0dUQO+whJmkOjjUNQfMtLD5d/laLfiDTYZxl1
	 jXAAw+zBemWVcMjKxLptkDWPeSFb/uJFvaWLW4FaXxxycF3shbLzJRhePBF6gPEmfQ
	 BhaJzBsJNKYxqiNn4anfNrY9WqYLUILe9qsZ9eLnCGQvCUu+vOGGTAv25IK4SyCFuI
	 Lzj4AIPI0e+Eg==
Message-ID: <sashiko-outbox-201891@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: control: Trim whitespace from sysfs input
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeraj S Kurup" <sreekuttan2156239@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261106165531.4074-1-sreekuttan2156239@gmail.com>
References: <20261106165531.4074-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 17:02:50 +0000
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
- [Low] ALSA: control: missing Fixes trailer for set_led_id() whitespace
  fix
--

commit fba9994b6098b77ca57c53a57ff6876210ceae6a
Author: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

> ALSA: control: Trim whitespace from sysfs input
>
> The attach and detach sysfs interfaces receive input from
> userspace.
>
> When userspace writes a value using echo, the input normally
> ends with a newline character.
>
> The parser does not remove this newline in all input formats.
> For example, a bare numeric ID can be treated as a control name,
> and an unquoted name=3D field can include the newline.
>
> Trim leading and trailing whitespace before parsing the input.
>
> This keeps spaces inside mixer control names unchanged.
>
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

[Severity: Low]
Since this fixes newline handling in set_led_id(), should it include:

  Fixes: a135dfb5de15 ("ALSA: led control - add sysfs kcontrol LED marking =
layer")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106165531.4074=
-1-sreekuttan2156239@gmail.com?part=3D1
