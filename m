Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623303;
	b=yTJmSIGeKq87nRS0GHcs9YIFImv00XQUPAX+QQTd4weV1ANqFLLWZpUQ00NLdA/4O7sh
	 9cJF0bOEgElr2FBhlbGZFH453t+eZQgVhHKVqfmt0Wk6MrQAc7uHYbx2aZ1wq823i6YwC
	 p/yS5+1lmKhjLd26FRwTfUZSdgSeuH2h+9gPa7c+F8ByRv71hq82sg05+XkMAA6j8E80r
	 mXe7UjRRvsXCqRCVFC3nT1fESefa8AL10ZRC+KltwMg3x7O+gL1SmS41xZWltVOMuv2B9
	 +fVFZUBywfKb5q260mU+I9+elHV/UGOo+VLshm+bHFzJFwFDfYiSWg8ZUKuR028rSEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623303;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=BKD3ZF3nLJ6ZB1lLYdI/5TV4jJ+1t7sDNL8KDkqlnt8=;
	b=yQf2AuwykgdyFTe3Aco1HJsChU+asEczr42ol2loUZW5/4ylXE0vaGmwcDj69nwEJSLx
	 DPUFVSSp71uv01RwmDG88cmT6U+aSJoLIwrekAZGRCJJ1KFUw/yfFZMHjAgZVOsna6sKd
	 uRS/RlWuIFJ9MEEdDYjgHXPwGiTDkXvbjGg6LlGjGVwYeNVyrAEFwVb+h8XDAeRPGclVe
	 XorkpO5ppiJzk9MHcQzAx/n8vrMNnRy1e9ANgsUTo3drbob3suHpvhkTaLLhagfKZ8sV8
	 3k39k/mGfDq1JvYLMmi8gZ3aUyvCbbLSzHKib/HSsuMX53Sd60bipAyMcxUNt/kq1zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TzBL++i9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ED160A380C
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 12:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TzBL++i9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249071F00A1F;
	Mon,  2 Nov 2026 12:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793623303;
	bh=BKD3ZF3nLJ6ZB1lLYdI/5TV4jJ+1t7sDNL8KDkqlnt8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TzBL++i9vcQy1vPDb9kowBATtFM8BpxNUR8CIJzLwm1n616XM3UzKZRmgipaArRVB
	 iYkla3KMQa/9dMQjrMF3Hij/mqZJlUNpN1qVwY5+pd44x6Qusis5lKN/kEgm7czdzL
	 OuQP5Bf2t9GIrrvW4J+tccVH2hUcaqoWxbpSHm7ggAWy3/po+k/Zq1kmGlLtSmYHTY
	 IiPSF4jiEANtO20atyEEWCQeC/KApA+TMLNVksR5A00W8WUa1KTQ+cWzus9GgZSI8r
	 hZ+LAX9J2FeAIjV4HrNtRFjwA4+z+/xrQ6acQnocSsQPc22DNMbJOh3h4pQAXosusx
	 9Ytz8636ctWjg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 6968A231040C;
	Mon, 02 Nov 2026 12:41:41 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Zhang Yi <zhangyi@everest-semi.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261030065441.2020789-2-thnkslprpt@gmail.com>
References: <20261030065441.2020789-2-thnkslprpt@gmail.com>
Subject: Re: [PATCH] ASoC: es9356: propagate HID button read errors
Message-Id: <179357784365.1716893.12888031613655953078.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:04:03 +0000
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107; i=broonie@kernel.org;
 h=from:subject:message-id; bh=shgqCOgygmqZ2gS3kDBdlXaP6FR3nwPMVw18GWfgOQc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJetLJq8O24Ff8l7cxLVzmdpXytPKv4WTY2qzTN17l06
 PeMWJNpHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjIwh2MDM2LI1trjt15v9Bz
 p/7T1uUCt9eLBn1b4rP73c+FeezL9BQZ/jutXje7hbd1bR2HmKaAzgnehNovmQva/h42jldYv+G
 pER8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 30 Oct 2026 08:54:42 +0200, Avi Weiss wrote:
> ASoC: es9356: propagate HID button read errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: es9356: propagate HID button read errors
      https://git.kernel.org/broonie/sound/c/b491075b3f9a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

