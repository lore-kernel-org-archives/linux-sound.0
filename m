Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725419;
	b=2ZeD17BvnJP5xOPTUKK/awsTXGzMx2QmSONgvyytI/Rs5fDOtPmuSYrViUbMa8DDAwRC
	 Ad1kVptlZuj+42i9HMWwEwhFWSaBVRkf7Osi7DKTth1PCBh5Y5bc2+2vag5sirZQvCzpV
	 m3hWDnt1/3hs1GsKF+28HEc+N5eb3cqxEI1PCFnlSJzoRI8JIL9RxC7VT7A0cShUhbTZa
	 F8R+GJ0gD8lc7LCqv7djDl+piR/UrdH9MFrNUg05lVGjKhGFf0uqNLGORyvdlYw9IjKHu
	 k1bi/n3ZTj+P8dI0+XCsN0zGUNTyW1R8WO9zQDBwbxhyDkKOR3znzgACn9xTp3tIz6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725419;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=stKUNQhxSdMEWWIIOxBWC9KKy1qL9fitxT9Ix58Ad9o=;
	b=bzNJDLIPh/8OwJisRgjpFe3yiLKvSl02WAz8tx1h3fHuc6mWLnD5x985TcpPkKMpKe+T
	 vLAsRlNtrwGjlFrWhsdx5Qxrj6PzEJ5079YZ+6YNKBTQq+fv0PDNRK2rAXo5CqbCxeF7E
	 uISA/LR8Xh/Tu9bpAsbUbr2rD0Nre3QyS9Z5h8c6j0n7M4QJ27k8Q1KBGnW3Hp60/ygVl
	 FRqHj5WibYnNl5dJ6fC+yt9cOXOWWTkMeDmom1l/A3DsyjgD6OtXyGqGpTd7JHm58N7j/
	 ZKKiN7/JEYnEImwSVRXcC+O6uKq3H7nALWwQufnQWt8t5UDqVGy98qpijSZK0NyERrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FUTHstla;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C859606D806
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 17:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FUTHstla
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FBD1F00A1B;
	Tue,  3 Nov 2026 17:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793725419;
	bh=stKUNQhxSdMEWWIIOxBWC9KKy1qL9fitxT9Ix58Ad9o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FUTHstlat713oTyhiMgEYn/acqf+6iYjis950iGvNi85R72C0MdQFojTz/bTRTbSa
	 OVRhtBAJBigzIvPyHXgwlssba0bn+oKqXq4S+0xGBcDnZDb2UpnBJVPAgHxo1IF4pe
	 QeInqLL78+Nspl9SiwrRYQcaUjHNt7sHStwRFMMgjLoVtQQi+UATgVaBL6i0Vy20dL
	 RO0ZNe1kPvWvcuvicF5geE+9sGNvWXddQN2zk7Ij5mCOtVU1jFPXqvEKDLpG+l1F6f
	 CHkLQew7Uq7NOCFUTOebsWc7NzjDyJTh3UTuATEz451zEMj78tH+fT7dCvDyFHX90Z
	 xX0vlh5NnBNIQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 12BDA2557289;
	Tue, 03 Nov 2026 17:03:37 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20261023202941.87999-1-olivier@mgcrea.io>
References: <20261023202941.87999-1-olivier@mgcrea.io>
Subject: Re: (subset) [PATCH v2 1/2] ASoC: cs43130: Drop only the clock
 reference hw_params() took
Message-Id: <179365952976.2186205.10211763246242798287.b4-ty@b4>
Date: Mon, 02 Nov 2026 22:45:29 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bMhPAydnj/9RZ9/vTqkZpNP5Pj+pCiy2C6kt6X/oyaI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeCb+4LNcpdUV8tWqY64srHCqbU/SiIiIaQnWWS7G2y
 ncJ3GntKGVhEONikBVTZInL4n5ZX/J6Dd/BhW0wc1iZQIYwcHEKwERW2DMybN/+7MvS6uC6oK0r
 N79dKH/5/F+N38s3Lr6Rkxw0SWySwiRGhmuPr+r0FM+YHzpboXvZ0vQbm1RfL5EpXDl5g/x3ed6
 rRWwA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 23 Oct 2026 22:29:40 +0200, Olivier Louvignes wrote:
> ASoC: cs43130: Drop only the clock reference hw_params() took

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: cs43130: Drop only the clock reference hw_params() took
      https://git.kernel.org/broonie/sound/c/9c4dc9a07388

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

