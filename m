Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84666DF78
	for <linux-sound@vger.kernel.org>; Mon, 23 Dec 2024 03:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734925786; cv=none; b=NkTeSUO42tGK2ER69gu/imikNZJ5WAznteOzT48c/FKv8A08jxxLAhIL6GwTf9s+jgOiklyNRL1r+ql9xf6BEEYtQ2iUx+QYjmc3BwxvjGtPlMhzI6Euk+7f5NP6DqQ1wptHDjBxMt7DK3N7I/MUG60cLzbsnACP3qwtmww9/Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734925786; c=relaxed/simple;
	bh=Dm+DpTrZbu1oZHpoJD1mmoat9Hm/RMtTFKCu+rXW3yk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nYiC31clY9k+t+wr3SaTND/dEF/t0MaVdeAEknAT/QUobdHhtpdErlUxyHUjD0aIsSiZdz7LenPsyeTZvrVSAsKq6xcko5qmA8hiBxY/r2ctbTIhAH59YGnMx6oieBKQbaLG4pQ4TBkMmOiadWOQ4TX/kED8SWek51ZMefZ1WFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=E9cVcwxx; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="E9cVcwxx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=protonmail3; t=1734925777; x=1735184977;
	bh=Dm+DpTrZbu1oZHpoJD1mmoat9Hm/RMtTFKCu+rXW3yk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=E9cVcwxxvqFd49yPfvUY+bFvIIVpOO5PSR5aRGd6uD6ErktdHj+fKzS/LYyJlGc8l
	 TQMNbKNiOhALt8ctC1vlIXTSfx7FR8XXcAnu9WprWuZcuY38/h7MwtOqw59kOLtlGd
	 1+106UAtl5kudHOaB9u9sZnrptuN8wjYIwvwT/fSkVmw659zDozKAUWWJ7XLeIfROQ
	 82EixVww/CZnCQa1W0JDgEBo8fzbgpsVZvsM6dWuXy0aji69NTf5GITOwaLVayALyf
	 BXefc5lq2m9zfiUyL1F3Kl/msOJa7o6Be5JL4pUL6dE8Fci6RN4w7uimv0mikKvPrI
	 LHZ3F8G99SDAQ==
Date: Mon, 23 Dec 2024 03:49:33 +0000
To: "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>, "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>, "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: [PATCH] ASoC: cs42l43: don't include '<linux/find.h>' directly
Message-ID: <UUMp3n9V_6fIKNfx27qkKnXyxb_nmGONQLjEEkwaQrQShqZvuFaKj2dDdT8uTAcw6SstCGLq1LTzfNLdTnoGzt2gXBnbbdt8xlZt6wSSz44=@ethancedwards.com>
In-Reply-To: <t6y2aF0s2AtDT4mGv1iU8dxfUrRqRkiQL3ax3glwnfcpMZWTXxPvSdpnw2uQ5LjKQMNH6E8nNuLfmwAFzdS1Nllld4cW8Qxz5pO2XhNo984=@ethancedwards.com>
References: <t6y2aF0s2AtDT4mGv1iU8dxfUrRqRkiQL3ax3glwnfcpMZWTXxPvSdpnw2uQ5LjKQMNH6E8nNuLfmwAFzdS1Nllld4cW8Qxz5pO2XhNo984=@ethancedwards.com>
Feedback-ID: 28410670:user:proton
X-Pm-Message-ID: 786028292396b9bb3328f7146d7dba42cc88eeb1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Just realized someone else got this via lore.kernel.org. My tree didn't inc=
lude those changes. Sorry! Let me know how I can avoid doing that in the fu=
ture, new dev. here.

Thanks,
Ethan
