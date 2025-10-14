Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4EF749C
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 13:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760449630; cv=none; b=e//8l79ieqEa6sGYc8EjnDEhu2+X2htk+nlJPBGsTDeVlSco7/oReJDdhXYfYJY7qeuyQF7UvsmmE6xN/Cdk3T1e8bTxN1DnWVhZkOZhZ7CzNssiB1/6nTVlnNsRtDmMe5rdAeKWBZHo/ykl+P/0kJkR1g5DUbZzOzrRA0apfOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760449630; c=relaxed/simple;
	bh=QJUAL04fmlV37uAJuhG826QwQjJJsIZga+Xpru4gbr4=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=gjh8xZ7W3lvUXeZsW0J+VJRqmy8EfwGpMjUpIRpjIiGdXrSf7KBo4Ke0kAvUxckE3X83TjcSjPRnxtjzImB5yixguq+bzB8OevX8EaGwkXB9ANhsfGz4NUpvCgrIBb52IGIjxRXVoebIN1Hv8F4KNExrjrKk6Micp4JdWv1kHn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=AGpvclYR; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="AGpvclYR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1760449618; x=1760708818;
	bh=QJUAL04fmlV37uAJuhG826QwQjJJsIZga+Xpru4gbr4=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=AGpvclYRwVSV5DWb6KQ2ptkFeP36zJW03DLl2H61+jGrYsSHuH0VS1OgAkJGGtnZG
	 zjzRzpefEVFcdSN3V260VGPg5RM9TCQ9WYopQqAtkh5ixbGtCU6zUOc81HmzXBe1mZ
	 pUIOUzOOiQXyRabQuuHq6TWhkqb4Zy93iyXkDhAp699WRz2E4PLuEIDgVu4CgNw84C
	 W+9vyF+piZt8OQ5iHKnvYaEJwLxOZysoDBQVcV67Jp2M25/my1a7RFFQxEA8aXXvR5
	 Ti2UoGHbCOm8Dq2bW8y3q2xuo2m6WtiFQPNIlr21WTiZDnfCotfAFeRyou8EqxAbjE
	 apI43svtyJsiQ==
Date: Tue, 14 Oct 2025 13:46:55 +0000
To: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
From: =?utf-8?Q?Tomasz_Dro=C5=BCd=C5=BC?= <tomasz.drozdz.1@protonmail.com>
Subject: Realtek ALC897 no 5.1, 7.1 surround sound.
Message-ID: <ZW2-bs5LIbMrN3ULr-UC3aWl_zzm0nYByUT2MszvpABCQifCxOgTpgT6TfnAKT-XaDLDOI8tL6srKiqCEY9aKzop2Wi9ZbxY1NOMXaifA5s=@protonmail.com>
Feedback-ID: 6711154:user:proton
X-Pm-Message-ID: bd4ec1491dc0e690d5d1b8404a480ec899a0079f
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello all.

I use Fedora Silverblue.
I have: 7.1 CH HD Audio (Realtek ALC897 Audio Codec), Nahimic Audio, as my =
sound card.
But unfortunately I can not set it to work in 5.1, 7.1 surround mode.

I do not see my model here: https://docs.kernel.org/sound/hd-audio/models.h=
tml
so I think it may be not supported by Linux ?

I have asked for help:
- https://discussion.fedoraproject.org/t/5-1-7-1-sound-speakers/156932/5
- https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/4788
- https://github.com/alsa-project/alsa-ucm-conf/issues/590

and they said I should ask on kernel mailing list.

What more info can I provide to You ?
Can You please assist, help ?


Sent with Proton Mail secure email.
