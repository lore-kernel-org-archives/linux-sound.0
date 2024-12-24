Received: from mail-10627.protonmail.ch (mail-10627.protonmail.ch [79.135.106.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAAD3EA76
	for <linux-sound@vger.kernel.org>; Tue, 24 Dec 2024 23:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735082194; cv=none; b=NTZM5lIBSYNOBYO5eTbuVaN6wqCadCEQEDkF86RnsXV27vdChWJ/rw4Wk0idz3Vfe+zeu4QfOfxFGfKwqWFjzZHxDMUAVguNxNrSJGPDLWovraXdccEoluWbGlV5qXYnPUOjC2b3JKxJaBCKDmj7oTCsef6W8mZ8IsdnkJzFxeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735082194; c=relaxed/simple;
	bh=fGXPe65NwvL6pmaki3ZSfpY1t4rQKVkrQrfY1j1zeZo=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VO3RIBNrOfAt50pjyvkIL7hP5OTG3FvwXSBdpABcPcPP6MgaZk79pQsdNEAGI58T2RNqPQDTGjFP+B/ERglN8mC8CeG/UM2/3zuXZXKwJ1nUpB7rg+wu1cNqUh6jKQfVMu5ZCpxRKCgvgVr774Xh25BTMeqfP6yWFYJJd/YI6qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=Xc/o92uw; arc=none smtp.client-ip=79.135.106.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="Xc/o92uw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=protonmail3; t=1735082181; x=1735341381;
	bh=fGXPe65NwvL6pmaki3ZSfpY1t4rQKVkrQrfY1j1zeZo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=Xc/o92uwIBrwO9uidI1h+bzV89vfZhAJW+e9sdDoXOWNUOqBkrXBhoswNAfurjMc6
	 7qeenqUjEE6QcYEvWFro4XcDRgXinGwzV7JmSUkIJisJZUNVUFWEt3luFgPV3XRmtW
	 8SNi4C7rMfY0LDZEOok1URWCW9ZTPAepwSzbjta8aSv5SEjgSwcAuneLzuS570jTAR
	 KNGUoGCt9+PP/gOuukxLSzfQaPxjrAHPHGps+zF942jQSD8MuhixsV2skUV89gGrrt
	 bxa2PHzJyNuhTOL5AmSSvj0O/VEmxcp1dWimh5pI/+edJuFzrD5Vn8hJsuQqouC4KA
	 OHrM+SAkBjAhw==
Date: Tue, 24 Dec 2024 23:16:17 +0000
To: "wychay@ctl.creative.com" <wychay@ctl.creative.com>, "ryan_richards@creativelabs.com" <ryan_richards@creativelabs.com>, "tiwai@suse.de" <tiwai@suse.de>
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: sound/pci/ctxfi/ctdaio.c: duplicate function removal question
Message-ID: <NyKCr2VHK_xCQDwNxFKKx2LVd2d_AC2f2j4eAvnD9uRPtb50i2AruCLOp6mHxsGiyYJ0Tgd3Z50Oy1JTi5gPhjd2WQM2skrv7asp3fLl8HU=@ethancedwards.com>
Feedback-ID: 28410670:user:proton
X-Pm-Message-ID: a9897bc6b12c0bffc19193e399ccbf01bd63bd36
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello all,

First of all, happy holidays.=20

I was browsing the ctdaio.c code and I noticed a lot of=20
duplicate code and functions, specifically:

dao_set_{right,left}_input and
dao_clear_{right,left}_input functions.

The functions are pretty much identical. They only=20
differ in the side (left, right). What was the original
idea in doing this? Wouldn't it make more since to just
have an ENUM (left, right) as an argument that would=20
determine the side and just reduce the function to=20
dao_set_input and dao_clear_input.=20

I would be more than happy to send in a patch doing
these changes, but before I did I wanted to ask if
there was a reason the code was written in this way.
I am pretty new to kernel development.

Thanks,
Ethan
--
Ethan Carter Edwards
CompTIA A+, Security+, and ISC2 (CC)
Ham Radio: AE4CE
Website: https://ethancedwards.com

