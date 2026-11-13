Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606872;
	b=vqKVxtkGu79HilOvc3/HdvNYgLt1Xzjy/9VJfE8sm1gVsCQE+m67BFsEbE9gZv3Y+a2I
	 Kwq861kHJYJMgC99I9jqxceg3nGJNPcQoEbvedfVr6XAXk+5ySZGB/69VOAyTevmCCbUn
	 2wpyG5NfRJ1hh37fEPqNF1CJ+Gr5mGqaem4X76DXnx34D4KegQMlgLMBq448tZx0Z+Jxz
	 syDItd8NCrCPg6msGnFHpERAVNuuL9nYV2E3Xpaejyz7Cu9OeFabH4D2Qa9K3rSzQxwwZ
	 TMImn5AjqOekB4M1OjdiBhD6Lo/gEZJsk9SgUnjJK2FHfdzTdfKBJJA2Cf3oL9JyhVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606872;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XGsFRYVHXIs6MecNwTbHpazlETwbMjixLYkKs24qIsU=;
	b=hH/ZtO5xv56VyrBcIdk2NLwS6kXkoKo5G2PDEwMbGA8Wzn4MuycIDC2AynQyduQTxNVq
	 1YDK37go3x/pezAdtzcgwaOb3d+k7NGWUyGYXZVCe8DVPYZqr9BxchtuGwn95qlSsCQEf
	 43/qxrGXZef9RbhaueewnIYgi+yPJuIkmXxMob0k5OzTl7O4D8iVG/k69TEQZxG29DHc3
	 GaCmO/ueoqk75CWS2UoDrUdHIrW21OfzEkGvpUAADfduaOSL2Q8ZU1lYaHS6eLmC+yH+D
	 fHfLiwt7jnlxd1KwTBFBfcCVNO1hfvthcynOlqFn3Bx3jWGzfy6rRZfPmmP36FRkfhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JW8ZPsB9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1C9606A323
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 21:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JW8ZPsB9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551B61F000C4;
	Fri, 13 Nov 2026 21:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794606872;
	bh=XGsFRYVHXIs6MecNwTbHpazlETwbMjixLYkKs24qIsU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JW8ZPsB9Xp9m6of+htr510nRFYDcrQygS9HLl64snWbP5hrlqvjC0DZQs3d9B9KKN
	 CqDEAvoDsd1yyc4FTBAUAwr7RBrZiIcxL5+ujXOemTn705vLje6tMTpGNKMzW1IEFF
	 VC5AfBDL3kibP4IWq4FHQ4KxGyc12ZC9PtZ7FatlG8sL9rwz894IzqJue5SYvFxkQa
	 SaZyoumeAr8dle/5izOOFM5QeARgpw0QzOaY9K0p3liD7X4ZlYCYdsKt5X+0x93hsc
	 DGA9uI6Ch6U6mra9cWrNRBHN9osfKuthzMH500Ff/vvNovJyuj003tGwk4Qpk9CJVA
	 jRZWFU3kd7brw==
Message-ID: <sashiko-outbox-213743@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: qcom: common: report line-out plugs on the
 Headphone Jack pin
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261113214544.232836-1-ingo.kubbilun@gmail.com>
References: <20261113214544.232836-1-ingo.kubbilun@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 21:54:31 +0000
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
- [Low] ASoC: qcom: common: missing Fixes trailer for
  qcom_headset_jack_pins
--

commit 0fd555bd073d8d5bb7f8b16e45526f52c4eac77a
Author: Ingo A. Kubbilun <ingo.kubbilun@gmail.com>

> ASoC: qcom: common: report line-out plugs on the Headphone Jack pin
>
> The WCD MBHC classifies high-impedance loads (above linein_th, 5 kOhm
> on wcd938x) such as active speakers as SND_JACK_LINEOUT. The
> "Headphone Jack" pin only matched SND_JACK_HEADPHONE, so the jack
> control stayed off and userspace (UCM JackControl) never switched to
> the headphone output for those loads.
>
> Seen on ASUS Vivobook S16 S3607QA (X1P42100, WCD9385): active
> speakers measured at ~20 kOhm per channel were reported as LINEOUT only.
>
> Developed with the help of an AI coding assistant (Anthropic Claude),
> which drafted the changes from the Windows ACPI tables, existing device
> trees and test logs; reviewed, built and tested on the device by the
> submitter.
>
> Signed-off-by: Ingo A. Kubbilun <ingo.kubbilun@gmail.com>

[Severity: Low]
This fixes the "Headphone Jack" pin mask in qcom_headset_jack_pins[],
which omitted SND_JACK_LINEOUT when jack pins were added.  Should the
commit message include:

  Fixes: 4c2c935a278e ("ASoC: qcom: common: add kcontrol to jack pins")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113214544.2328=
36-1-ingo.kubbilun@gmail.com?part=3D1
