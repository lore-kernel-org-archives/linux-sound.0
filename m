Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D8E1E531
	for <linux-sound@vger.kernel.org>; Sun, 18 Jan 2026 13:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768743171; cv=none; b=dBoHsvnE4fay3PCoKwZ3JZlKO5flqo4PRY+LVym6zh83PqYI8Gtmmo4r7GwLeaSeG+IfqANeFluGoWLVmWb7IVvm484FBfZ6avRW9KawaiAfvcZxcATRt0TF4kmfOxhtIB6OKoHWyQXkPBvAXOYXzyciMr/7MdZ5qJLq0dyScr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768743171; c=relaxed/simple;
	bh=SyG/6s/2TtCxUQ7djCqHZsedMQaKPVQbw6rW2ZImSYA=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:From:Subject; b=GHwY0StbvNij81xbiXm3OyVBU6VqHHCEF3B6+jDAEFu6TK4xKdzgTjhLZrgbIs3+17bnl25jtX+BQq6gFI+swG4Agft3OqyFAL4ooE078ulPzK+JMSczOS9O7urua7/XOPSie8Qmwb6IAgbrWZ9j52fSMylMZQtppN+xa3cqiMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=retto@gmx.net header.b=YmOriOPL; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=retto@gmx.net header.b="YmOriOPL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1768743163; x=1769347963; i=retto@gmx.net;
	bh=SyG/6s/2TtCxUQ7djCqHZsedMQaKPVQbw6rW2ZImSYA=;
	h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:To:
	 From:Subject:cc:content-transfer-encoding:content-type:date:from:
	 message-id:mime-version:reply-to:subject:to;
	b=YmOriOPLr6FI14mOJartVfpTGjNo28i/N459zRtpjKkPkcQYjw0ScVGYrIXVCWik
	 UF8QyyWpb52J6f0J50+nWNwu3t6RLjnjdwQ5BFp7H5lYg1mUL+gUcgt6N+kk0Y0Yz
	 DgQgB0Wcv+OWIinVILm8mEpDGTwSEEa66P3tAG+Q5t7ExxBP+BsbzdogWfkxkZMij
	 WJIPlpbruefVwgmUEgzpmVGvFqHcoKPxN7jeYHYBFcn4OtCBS1xAeNuo73h8qHaog
	 1uL8P5a2Q78HEukApDHpGGCgJjKdjFG3Z9D+g6CgwBgpbN9C80p3tlC8InOoRE/6E
	 oumn6n6+oVG23uZcBQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.2.117] ([94.31.112.148]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEFzr-1vXoNS0CjF-00HBC0; Sun, 18
 Jan 2026 14:32:43 +0100
Content-Type: multipart/mixed; boundary="------------5ZymenWoX7wh5bOH4p53hHTA"
Message-ID: <4506ea87-d4c2-4db9-80f8-267a7a015cf2@gmx.net>
Date: Sun, 18 Jan 2026 14:32:42 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: broonie@kernel.org, linux-sound@vger.kernel.org
From: Sven Rettig <retto@gmx.net>
Subject: PATCH: ASoC: amd: yc: Fix microphone on ASUS PM1503CDA
X-Provags-ID: V03:K1:9idvr3A/mpoVuxstDkXYd0QHhN3FCpfE9nqx14oqWpJt9Sq0Buw
 N4SfuN8/kbGZvxnpFmn4TWkJdtTxS/LHrtNThebR3/qHKBgzYQyPpXq+kZjc4Yo+2Ho2Ma8
 CuslYJYo3jm6OprYSt4GySnOAgedRhtPNJ/8nOUa/53H0kTVxiHUr63Xd6wIF+x2nEt/ozm
 ebAIBccT9V6uscYhnEdww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/1GW+5/VFik=;5OLHB0OGx2xyz1ub7K1B/eDlZhZ
 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
 Q0rikpVJEA71MTMTYWgR

This is a multi-part message in MIME format.
--------------5ZymenWoX7wh5bOH4p53hHTA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Add DMI match for ASUSTeK COMPUTER INC. PM1503CDA to enable the internal=
=20
microphone.

Signed-off-by: Sven Rettig <retto@gmx.net>

--------------5ZymenWoX7wh5bOH4p53hHTA
Content-Type: text/plain; charset=UTF-8; name="patch"
Content-Disposition: attachment; filename="patch"
Content-Transfer-Encoding: base64

LS0tIHNvdW5kL3NvYy9hbWQveWMvYWNwNngtbWFjaC5jLm9yaWcJMjAyNi0wMS0xOCAxNDow
OTo1OC4zNzA3MjcwNjIgKzAxMDAKKysrIHNvdW5kL3NvYy9hbWQveWMvYWNwNngtbWFjaC5j
CTIwMjYtMDEtMTggMTQ6MTA6NTQuNTMyMzM2NjIxICswMTAwCkBAIC00NjEsNiArNDYxLDEz
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCB5Y19hY3AKIAl7CiAJCS5k
cml2ZXJfZGF0YSA9ICZhY3A2eF9jYXJkLAogCQkubWF0Y2hlcyA9IHsKKwkJCURNSV9NQVRD
SChETUlfQk9BUkRfVkVORE9SLCAiQVNVU1RlSyBDT01QVVRFUiBJTkMuIiksCisJCQlETUlf
TUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwgIlBNMTUwM0NEQSIpLAorCQl9CisJfSwKKwl7CisJ
CS5kcml2ZXJfZGF0YSA9ICZhY3A2eF9jYXJkLAorCQkubWF0Y2hlcyA9IHsKIAkJCURNSV9N
QVRDSChETUlfQk9BUkRfVkVORE9SLCAiTWljcm8tU3RhciBJbnRlcm5hdGlvbmFsIENvLiwg
THRkLiIpLAogCQkJRE1JX01BVENIKERNSV9QUk9EVUNUX05BTUUsICJCcmF2byAxNSBCN0VE
IiksCiAJCX0K

--------------5ZymenWoX7wh5bOH4p53hHTA--
