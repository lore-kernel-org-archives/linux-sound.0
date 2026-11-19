Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795122954;
	b=vizX7P0GjEr7hcoFxYVWYyWtwH3ZaUR4rGjSGSKlqrINFZ7f+sxgNUFnqqI2kTkYxAc5
	 GnXr+JExID4QCKTnqqrpkcbOHIhYaJXo3d6PoVyLgbtC/vNXDhqCP9EmxJm9gAefunSGt
	 RehAHSLo+iytpZIZcPuij6HdeM6lF2L4Ibcc9iWQUSTtZlJHLEGoIRcGYUbKNyYLemhzs
	 d35EmFrp/lFhXjuQI+E9YkMAfUEIYSqO+H3igJpLfw4QCsV0isvjI3TI4sN+2SNf7bZtN
	 hSCPh3x6K2IXHWJm9oK7zRB/MH6RPa8EnkGgWbk1xr+jqxvK8XsvW3dnrIBqJ+3n0Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122954;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/awpqJetQYYWcvrP4IjLV42AD5rDLgMatQr7GlHX9u4=;
	b=qE8UOpoFoKAFY3nFoDaMUmX9j/r6qPpYWQHuiv1zPmAA6XBKJgeZ/vbMhAXjUNCNQvxk
	 fBYa/H9lTh6ChO2Vs+NBNCEtOlxVVADilD7DlvF2cFc0RTy5z2I03DMaQV23/MQN3us/g
	 PdZjigsQgKHecBPqpoqQYdULShejEAnHOzY6KO6RuZqDoEbbqHRCJgUJzYzupRxxqJK1y
	 WSm45grFxJxYbfBLTtkch3FXRsjHElm/sJTjmlHb+HCPLjKOy5JE+reHabm4HHax7Z+zd
	 brhHY7H/93bkus8Ct0pQalsd2G8NsziY0jISgQn928JsFy2IPxYl8N3qn8Q8EiayJiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GgzEJ/GI";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FE8606A33B;
	Thu, 19 Nov 2026 21:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GgzEJ/GI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED24D1F000D8;
	Thu, 19 Nov 2026 21:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795122954;
	bh=/awpqJetQYYWcvrP4IjLV42AD5rDLgMatQr7GlHX9u4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GgzEJ/GIfc8+S4/t/IBek4ZmsUicTso4finodxPnQ+C3pFKljruYTg5oEXONM04+z
	 UQukyunMgS2lOEzg7ixFL5puPwd+goJVV7te9xzrFXFdY4fQDIFfkfWo1kB1dDVkWW
	 rtnbG+fdQwt1M3l2Ai06I2S4iv5dqip6Gq/HXzsia/9fyRUV3uk+zUPgjoH7YcdFYd
	 wOysZ/fkbQ/Pyz+1u7dWkbyFzOfgZg83DsnyJX1i6Hx09fxTjc2MGw7URikuE2yHU7
	 NFzHsFY2pwXlViUtKL6/ck1A8VufPWtwYQiMuLA9E8I+T0z+VEYo7MBietnaJOgNqr
	 EjR5Vsa/py+hQ==
Date: Thu, 19 Nov 2026 21:15:50 +0000
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, patches@opensource.cirrus.com
Subject: [GIT PULL] Immutable branch between MFD and Regulator due for the
 v7.5 merge window
Message-ID: <20261119211550.GD70182@joneslee-macbookpro.roam.internal>
References: <20261112141650.1931348-2-ckeepax@opensource.cirrus.com>
 <179510674408.77674.4732953853855712916.b4-ty@b4>
 <22f5f813-79b1-41f0-849c-263224c651c9@sirena.org.uk>
 <20261119183211.GA70182@joneslee-macbookpro.roam.internal>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119183211.GA70182@joneslee-macbookpro.roam.internal>

Enjoy!

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-asoc-v7.5

for you to fetch changes up to e367b5f639b494c29d5f504a9bbd9fcbac9c7885:

  mfd: cs42l43: Add load detection register needed for cs42l43b (2026-11-19 18:31:25 +0000)

----------------------------------------------------------------
Immutable branch between MFD and Regulator due for the v7.5 merge window

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEdrbJNaO+IJqU8IdIUa+KL4f8d2EFAmr/Zr4ACgkQUa+KL4f8
d2EOBg//ePkQ+E5r2KvyfmZfAIuX8o4XhsEmF/ZIa0VAq4ozm3iC2m1gdE2qTRFZ
xFmmwcxVUM5nLd4Bf1wetxEuKLNo3E3Z+PYUTLJIBjCOhNxKVCQxhKphRkBDhfbo
J6yjs3887bTr8UNptB2ypv+RqTeHjtAjibymHbR/W0AEWdf1u0DQPKl6aOLIBVqO
76z5FJJQOzIVfAnVfSR9MnrJaQOLbbPdDMsnk9TITya2K0orH+r8U5A8RmPO20lB
rYQQ5s7UBmlM3c/gUJxKl8q1chFcPxeVw4C1yGt1sCLrS9vpXtwhBSLyKrKgs7QZ
nHEmOi9lAMvlg8U2PQmUV8wVi/qmjV4aVWcCTlpywUqLOjTe8laMyKtY2o4MhEqV
b9nXe4PBnhfcYkiReZgC080zYJiITa/CIVWDUez6iYP0WmcFVg7fbtgdZK8E/cXm
uZm4gXDSyOGHuHd5g/o0zAmC0NmCCPzIg4cewJEDS3yt3zSndtZ3Red8GvWcMw6m
7ng1yiIzG6px+JYhzNhxBgcFxJkPRXubgL38gzbYN7fgDMqXFYhbi+VxAEplkPGH
nD8AEQBrWhTnynhw9qREbl2dWZ/GuylQvexa/w0MH46BLJrxG5vPcnUmYsjeD0pj
ZEk0l6Tam7109K4hk5s03E8yCngHX47P6dcANpBe+2KyVjA8auo=
=dJhZ
-----END PGP SIGNATURE-----

----------------------------------------------------------------
Charles Keepax (1):
      mfd: cs42l43: Add load detection register needed for cs42l43b

 drivers/mfd/cs42l43.c            | 2 ++
 include/linux/mfd/cs42l43-regs.h | 2 ++
 2 files changed, 4 insertions(+)

-- 
Lee Jones
