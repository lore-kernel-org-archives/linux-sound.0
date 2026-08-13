Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC16466B1B;
	Fri, 14 Aug 2026 11:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786707512; cv=none; b=j31P1eUMvuzSEcs2JN/IzHS/j40OjZkxGivZPXAn+McjYub368QulH7jMOQ+xcUDrJLHSMOTGRiqpBhYVw5u5jNewP7J0EYcQ5z4bn7m0H/iaCx79/gdPxG3RZ+iQvAPPTdyyUbt8NtZ89cpdb2XCWm72vna3FnLiZbTnIZOUnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786707512; c=relaxed/simple;
	bh=/dIWgFYOnCeF7pOf3dFG9Tx1R0lvVI3YJP/qYLnuBLo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mCFoqWswOsZFThUds0twd8LkMtezClrz1vR2cQwVPyEZwRIVMXY0x8XYE+xQCY7SYoDoSsUuJfES9lhiwwIMUOVbqvNrpEOAj5GHNR+hwwrHGnZFH79YsFcNSa5MnZyQJpxDzEAgJ7qGvbUPDrKAeBqf7c/uSqQ50aZRec6P76g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4VcIsaq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4VcIsaq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325301F000E9;
	Fri, 14 Aug 2026 11:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786707510;
	bh=d8rr7gyWjxIvYAn4l3NC3jbx10JD/zMrDYh8vHB41YA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=G4VcIsaqG3eX1edJnNWDiBF8ZgudsTmlAZxBxXZvoIvLz3bOnQisO4qwamQNIBpc6
	 brKt7ozjJDzrMuzbEkSsrxl4/sA10SV7NwwqGjKOy6CIFhys2TpJMlClA0v+wOC0c/
	 bu8YUycUvYtjGNZDsgS8/GVFCD6Jz9v164MJ2kCvo2gA2ZgY+g558Up3uvyzflfmsy
	 RR545VnFb+fWmB1cjaXNvGUivCyMRcQreQ2HUxd1QKsIlZB7yVfzij5yhzfCGNPnA6
	 WME/bk8MW/LTncYWjehE5wznf03VsmkXTkVxVr1XDLanmnHd/76j67gThfCQLW1Jh2
	 mctVQc6gCCAQw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Shimizu <rosh@debian.org>
In-Reply-To: <20260813-b4-es8316-binding-conditional-fix-v1-1-6cd56aa1370c@thundersoft.com>
References: <20260813-b4-es8316-binding-conditional-fix-v1-1-6cd56aa1370c@thundersoft.com>
Subject: Re: [PATCH] ASoC: dt-bindings: es8316: Fix supply property
 constraints
Message-Id: <178663979517.110398.12591413702165872564.b4-ty@b4>
Date: Thu, 13 Aug 2026 17:49:55 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/dIWgFYOnCeF7pOf3dFG9Tx1R0lvVI3YJP/qYLnuBLo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqfv4x5NbCkOsqzEKaXIEIgK06CAoAOb4uJ3F88
 Zw4AkgSPEiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCan7+MQAKCRAk1otyXVSH
 0B6hB/0eGrAZTc/v+gp6zZvpCrOmM+57KkO59AES3qAcgLNsTtzaCiBlG8ltKZvQ6JJmAnRsfMM
 9+PHiTc1MQ5JSz+iHu4lLjUIh7+uj8ZcBhL4Q1mIen2/9bqf7m3pRfgvSNlVutN8ngCUFHMsUtj
 ApvZpSIaGXu+4r/HNsg3wg9sbxGDK3F/+1k6hBwCKq/bEaI8UjxGx26AP9zF5CSt5cGM0hfpx+c
 5fL68sWRH65IOP5sF8igehl7qoXdvxG0vMDe9nwSPEJnCxkyXfzwQW887JfzAY60vfsWl6P0eGq
 n+GP6t620XEBaRoktDzL51Jez9ckiDOG81FfQz27pvm9ZGN2
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 13 Aug 2026 19:53:34 +0800, Hongyang Zhao wrote:
> ASoC: dt-bindings: es8316: Fix supply property constraints

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: dt-bindings: es8316: Fix supply property constraints
      https://git.kernel.org/broonie/sound/c/bc34c37ed826

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

