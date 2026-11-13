Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602370;
	b=nienaMdV3xLRgy7Uv93Fo7lLFss2VOSIu2uqUOy1CjmQgA+R0He3Wl1Q8NN/yVUHFdt+
	 fqe8H9irwFbXSZopEwQzQlUvc3soY5q8m9k9txWZ09XdvqE/D0TPV9aID8iXaPlZlkKSd
	 zB4iHCw8J28he8+Phpw3u4q+E656Fd+TsfVmE2fr3xoteGFlbe2JrePX75v78UBZCMvsb
	 20B3C3NF4EU+XhpKMMljKp7AUH0AkOfiQlrr99n2sQEDJ+APMOx+2UPz8ZukcVWVAogO8
	 RIEn+hjLlkdQpx7n0BZjes2oxWjSbjUz+nK/dygvnQ2q5CFeue+8XtKtYxwOWGUozZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602370;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=m+mtbBMC4uqwG6if7utQ/X44Gq9L+CUdloIOZbIRr30=;
	b=GcLH/xQ5Z3Bfx8B6tkhtOMKwFcAH3EMt0lkt47XRpfoeCJwSihjOrr93osxUm31kkQgj
	 3AlygPZyGoqnFins0T8hlu2OvjBKRmMbeosijdsMTFLcjzBJ4mA5sKSqdfjzVv/vmgL0H
	 JCM0a/FYfQQSslUSG1R1jS664vKgndwm88FbbfYXh8mpiiGnESTmnivZudHlfWr0Ahe9E
	 5fxdlDMzTJL8fjpc2789+bYagj0rzxPIOBnoK91rjVDpRoxTV8lC7Lg1LDVjzp7rNX4OM
	 sxufgAj9hJPb9M//OHtNdAC03ulKWAz+6yAC/SPxRp4ZGQfporiTvOWS+Ps4VcEoiiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nk1sQtvF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822FE606A323;
	Fri, 13 Nov 2026 20:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nk1sQtvF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9721F000C4;
	Fri, 13 Nov 2026 20:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794602370;
	bh=m+mtbBMC4uqwG6if7utQ/X44Gq9L+CUdloIOZbIRr30=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nk1sQtvFOZUd4KYr143/YaMO9CG/b8rZwZ0BL72rBAE4WgG72h60dOeMyNSGYa3K0
	 4vPPHuiXceB/DoczXwtOcTaEyBtYEBtJubFA2zrXwusYfONh4XVzxA1nwirT6uYFjQ
	 biQCuZbpz0GeW+ygXErRygnoFKfULcRWosj0W/ks3od3EfgFHfr448jBMqb351Ayd4
	 rK++/FbQdP/RfzVHz7BfNZDZkZfgAuGAr0wGwlTke3g2UI2vkowNoHSjML+8J3P62e
	 af/YxUPckGuh1SA6e0unjfreq1hPXLoGME6xcHxVAZZu6KFF+o7Qx7vuoQ5K7f1g7u
	 ku4tlGLpo/l2A==
Message-ID: <sashiko-outbox-213663@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: qcom: document Asus Vivobook 16
 X1607QA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Carter" <yass27106@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <2c4a807496c04047b6d5735e3946dd16@gmail.com>
References: <9032798812284dd2842cbf003c75cc0b@gmail.com>
 <2c4a807496c04047b6d5735e3946dd16@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 20:39:29 +0000
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
- [High] dt-bindings: arm: qcom: missing Signed-off-by trailer in commit
  message
- [Low] dt-bindings: arm: qcom: empty commit message body and wrong
  subject prefix
--

commit b00eb5a03440d334a1b8831281dccab415d1cb4c
Author: Daniel Carter <yass27106@gmail.com>

> dt-bindings: qcom: document Asus Vivobook 16 X1607QA

[Severity: High]
This commit is missing a Signed-off-by trailer, which is required by
Documentation/process/submitting-patches.rst before a patch can be merged.

[Severity: Low]
The commit message body is empty and omits a description of the Asus
Vivobook 16 X1607QA and its Qualcomm X1P42100 platform.  Also, commits
touching Documentation/devicetree/bindings/arm/qcom.yaml normally use the
"dt-bindings: arm: qcom:" subject prefix rather than "dt-bindings: qcom:".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2c4a807496c04047b6d=
5735e3946dd16@gmail.com?part=3D1
