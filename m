Received: from mail-106104.protonmail.ch (mail-106104.protonmail.ch [79.135.106.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8842D8363
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 08:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760517270; cv=none; b=PIZE0LpPd/uI7FLRELW7KGDpuHEAUrBlTI9Y2qVuQw8FhCNr0ZtQG+zkpBCWbnZO6NeI4FB7OUut5dStzsk/HLn2Bxt7muHqv47CCcMJU6Rc7/tOAv8MUVwokcB3jOnKEF6+Wft/wT4SlSjTPl6Efo8vG6iGnt9yuan8hmDuGnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760517270; c=relaxed/simple;
	bh=Swi/4uVDHbGmX9iw5OR4AmBXO/t7wESeGxTvuRKcXPk=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=AMjsLvzZyvsT9KMlaxL2bqLXV65F3o5sQLnnkIGhcjWQ9ZACBLBBvoCqdTjfYcoz3N2efXXb25XuQTog5D2WjGibo+SNvttCFNjOFsXZ6XumuuhSvD0P7aoqW5wGI0CmibvwRB/QeKaaBKDhd+hWgp/ozCs5Goou45kBHBgnFaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=VG3znrXl; arc=none smtp.client-ip=79.135.106.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="VG3znrXl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1760517261; x=1760776461;
	bh=Swi/4uVDHbGmX9iw5OR4AmBXO/t7wESeGxTvuRKcXPk=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=VG3znrXlga9vMNMejh416U/7SJ/hgRabEBjWKiAe42M+z4j0kEZCWjlcG3DLgU1u3
	 q63LtD5DVKegTQqy4OVX5wJde9L8dFZ/yzDIStA/eBwEmt/YMH6jyvgW+YjycBES2Q
	 sz1Gfh7/I23bSbGuqB2Lwj01hMb3qmjLyqJ531oz5q+4ZwehNIBVSIr4MA3AacQiWn
	 ZVeRaFjHwW4N9SUaCI/lRroEkirQLogm8/MX8rPd4BZKxcAIKas+XWwqsb5x1pEi1P
	 m9wD7ZvEh9Wkc1bAcc4EoFMFm3oaO8IEtKrmyrtjE2I8qP69Uw1Cvr7mTDVJrVTAkr
	 SF6HbuZJA3xew==
Date: Wed, 15 Oct 2025 08:34:16 +0000
To: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
From: =?utf-8?Q?Tomasz_Dro=C5=BCd=C5=BC?= <tomasz.drozdz.1@protonmail.com>
Subject: Realtek ALC897 - no 5.1 surround sound.
Message-ID: <WpC4wmD50rlPuivdEgS0NV22vN6CliRVVqhTaCpmVnY0D4ejo4Ny34F0hO5xaYWunIhVTf5O636OrGRzy3tyA5Ews6KHfWwmckXcHOIvhKo=@protonmail.com>
Feedback-ID: 6711154:user:proton
X-Pm-Message-ID: 4b71cdda187fa9d19a8148317565d3df26f92d0e
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
I have:=C2=A07.1 CH HD Audio (Realtek ALC897 Audio Codec), Nahimic Audio, a=
s my sound card.
But unfortunately I can not set it to work in 5.1, 7.1 surround mode.

I do not see my model here:=C2=A0https://docs.kernel.org/sound/hd-audio/mod=
els.html
so I think it may be not supported by Linux ?

I have asked for help:
-=C2=A0https://discussion.fedoraproject.org/t/5-1-7-1-sound-speakers/156932=
/5
-=C2=A0https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/4788
-=C2=A0https://github.com/alsa-project/alsa-ucm-conf/issues/590

and they said I should ask on kernel mailing list.

What more info can I provide to You ?
Can You please assist, help ?



Sent with Proton Mail secure email.
