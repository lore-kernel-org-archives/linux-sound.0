Received: from mout.mail.com (mout.mail.com [74.208.4.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E0D349B1D
	for <linux-sound@vger.kernel.org>; Wed,  7 Jan 2026 16:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.208.4.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767805069; cv=none; b=lIRsDxFdeu0C6Z/eWMKlX3Tv77nHP+q/87nxV4GQ1l1+ZbeElzA47NfIbak7sbpseVSnTNxzM9M1aOWVYszt3gDJFjtGQjcmAZDtrdjOQQ96Z6K9BRfuyUj3GCDB7re+GMZV1LkSEXnGNp/LwgRmefm3KyaOUOemO2EJh+0ZDDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767805069; c=relaxed/simple;
	bh=mdndEVYCVErZ9x5KXbnP4u8bS1CgWsiKSDjm2D242X4=;
	h=MIME-Version:Message-ID:From:To:Subject:Content-Type:Date; b=U/oViasUI0LoNtdrmjcJ71FzgbXb9tEQhBn0/S3UqNUO0EFJVv52Fa3vbNLi4vnPplGw9pgCACEmcP1yyHDZ8ibau7+3WCY6S1dZFuVjimRVDhwdDuInOiYIF1P9YuspimzpbjXZGknbaXeASwM5kznjoJfXx9FsFe94YMn1UlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.com; spf=pass smtp.mailfrom=mail.com; dkim=pass (2048-bit key) header.d=mail.com header.i=fenugrec@mail.com header.b=GGQFKCBq; arc=none smtp.client-ip=74.208.4.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.com header.i=fenugrec@mail.com header.b="GGQFKCBq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.com;
	s=s1089575; t=1767805061; x=1768409861; i=fenugrec@mail.com;
	bh=RskE+TOiDJkXAIQh1rz33yy0C1ihtzUvqQTmBa+IprU=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Subject:
	 Content-Type:Date:cc:content-transfer-encoding:content-type:date:
	 from:message-id:mime-version:reply-to:subject:to;
	b=GGQFKCBqk5GpLV6StAWniIQXblvtf3QyflnHHz6NQ6G3h/iKNR1gmBcMX/k5YMSt
	 JG+EAnlWUTJEB6SWmykNzYP/pcVM97HGTYrEejAVq2EI6uuvX/kUz/rT6dS2ScB3v
	 CogxeK48hn50nauiUzTksxttg9DMd20TqaSYXAoagBOV+MQhSGMKMz4PbhojUr5JS
	 XH2EctbmmzboxnXJvgiKW5jI0z3Q9gyawcAoDXF4hmlxvAMlN4j9fpM2nvJnTAoIP
	 VUN7CfWf8ncR4rGRZwlfXqNop7IycpmLLXjLrINcHIMbAHvJgxWg1MniOLf67/+Mb
	 PcXDNroVNUJvw5AE9A==
X-UI-Sender-Class: f2cb72be-343f-493d-8ec3-b1efb8d6185a
Received: from [192.214.232.39] ([192.214.232.39]) by web-mail.mail.com
 (3c-app-mailcom-lxa05.server.lan [10.76.45.6]) (via HTTP); Wed, 7 Jan 2026
 17:57:41 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-0d3414bb-7704-4eb9-b805-01baaa2fcb8d-1767805061344@3c-app-mailcom-lxa05>
From: fenugrec@mail.com
To: linux-sound@vger.kernel.org
Subject: accidental revert of Presonus 1824c quirk ?
Content-Type: text/plain; charset=UTF-8
Date: Wed, 7 Jan 2026 17:57:41 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:gZNDpCLMnfHB45EW2p41zU+axV+lg1uwefPsWW6Mul6cioKwm2wy2l+vnMLeSRqOL6iXd
 8cLW8HEZEHgpzdtPsWWDpTWx8n0e2CLM1GV2r1MEQo8J402zBGttS+k4UC21pWD3TxUzgzSHxxre
 0Kxw0zDjBJ9dOKC8QTm8G+FJ+csP6cv1J8dKHJoYUmBhF2/l0jNLEeNh5Zl+1CbITqPIIRQEkjhC
 uHxkiM9/tPphG7JY5ntNfPbAPFKnS5st4jiUsrkxiB+2/o+u/Jg7ahR+0LeQydRa6HQjefA1SsgL
 QI=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BP3NwZ7+Fe4=;p28XOzXCGmID1f0zkzBLH6a4T2U
 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

Hi,
I'm looking at this repo
https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/
and it seems a recent merge reverted a commit ?

Original commit
  d1d6ad7f6686e208aba06b7af3feef7a7cba61cf ALSA: usb-audio: don't apply interface quirk to Presonus S1824c
Merge that removes the added quirk:
  329bdcbbd229731dc5a8b6753aa2409f00869331 Merge branch 'for-linus' into for-next

- Was this on purpose ?
- Should I just be looking at a different repo to hack on this driver (Presonus series) ?

Thanks,
