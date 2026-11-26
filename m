Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705441;
	b=wyLbUgA9lZbIYVSMgtLJ+YyGwEOTDuUw2tvF2cOltpRJ49m9I/zSxFpjRb4k0Q3hw95A
	 NACCoTbDsPKSqTtdlj4vBO7rFJ6oJqvr+nuHsFkQhT9gDAnXfu+MK8Xv/70i7zF8JNMqR
	 pm6L0nVuQVE+YCB2quvpqhD53C07ZTjZ0C8KsMahYINljrYdG0VwB6z3olhY0ope6yX4o
	 lxkTTNZmOShxU83ow7gQkHxAZoEZXFQGbHujuA1h9NlKRprYpX8gJmuLQGAQjAIQkLzeB
	 GsWAs2WFelhAlm04JauNuaBW7lgdOpCHg6nJQZPpbQ6BBuUr51KlCKT8wW5RVrAxRlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705441;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=YBRc14lUEaOmFxgLPXFSCekukOE1vDmXmL5aptfI23Q=;
	b=pjOXnMvq9UMhqSP/jR4S5/CW5yGVjY/aHCj/3YjivmjtssmHGkc++OAXhcIkLx+veWcG
	 gRXCDvAcN1tMQnr6G5LwKonHJQ2t8l1ydEva7zRXpi9vdewAeWNI8+bhoZf35ngQNzJmI
	 u7y/Li9R176eCKvNiRPQdhieb9GFfeau8O9IdMKYDxonsvLatvJQ+aL/2aC23jwL8m8xJ
	 IOGZ48zr8vVY3xu1lbkZ1jEPYH0maSqIx2JRsT5O9p8Ek1oL41jnr//U0EGIRRyIARVMI
	 gVGMhWrUO2DSUANBObpvanLo/RhlDf2stXzEU4VuTX4UcP0UqeQGF20CuAXmyLS4w4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NDphB8m7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D3D606A329;
	Thu, 26 Nov 2026 15:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NDphB8m7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A4B1F000E1;
	Thu, 26 Nov 2026 15:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795705441;
	bh=YBRc14lUEaOmFxgLPXFSCekukOE1vDmXmL5aptfI23Q=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=NDphB8m7tIGr3eQ9MXKBhBzf38Xyi1GTCtL9LTBkaYA5wrgSuGLUbiI/nIKPsNpAL
	 xTeoBke3tY80CgCu/jxZuC/rXdoKbGFsBv0EDQk5zyfzyotHh0JS/K0MOLFWu2dL3y
	 6NSA3t2MB3enQNH7iGomSTpkOBv7IkVMkMzIuTsVsry9nZxOmLNhQ9Q99RtMgNwyrB
	 SpsVt0q5ldcf1DQEjtnZoK4rfT5Z2pP07pmjcpmodAftsmOTgzlfiPwf8kCU+3TsMp
	 wZOhr6JSA9k1WR2EuMfqHZZBcFekw0Xng7DjcNC0/kQzJAgdkrjNYzK7ZhPw4SYvt9
	 zCvc8DLYL824Q==
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/3] ASoC: qcom: q6dsp-lpass-clocks: Restore clocks
 after a DSP restart
From: Mark Brown <broonie@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Mohit Sharma <mohit.sharma@oss.qualcomm.com>, 
 Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>, 
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261115032027.414953-3-shengchao.guo@oss.qualcomm.com>
References: <20261115032027.414953-1-shengchao.guo@oss.qualcomm.com>
 <20261115032027.414953-3-shengchao.guo@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:03:56 +0000
Message-Id: <179570543630.142532.4469079087447157143.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=361; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UgEX0vgS3UE6eViNo/vgDBqvf0PacpH8EB3nFeCs0qg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5vGL3zQ95KfHz4un7mb+n9PD3GcxZ0OE9aduvOc9bj
 XjVTmcd7ShlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBELloxMlz0P2Jxzqzii9Ly
 9m67Y3O5v0xmTa3R0BfjvmUjqOfk8JiRoatldZRWcN3c4OaTChzbC2Pn17lXc7WEcCiVGzn2uT5
 kBgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The DSP forgets all clock requests and votes when it stops. A consumer
> that still holds a clock prepared across a DSP restart then holds a
> clock that the DSP no longer provides, and its later unprepare releases
> a request the DSP never saw.

This doesn't apply against current code, please check and resend.

-- 
Mark Brown <broonie@kernel.org>
