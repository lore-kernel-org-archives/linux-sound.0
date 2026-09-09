Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9251B3CF202
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 07:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937556; cv=none; b=rbBbXAgZ+BjJAHmK+excw+jgoEtvO6rUexwVsUMVLyTBzSiWgIJ5evAYrb0pDa6eqf5p8YJcr/+X3u/YJ4FPeeVuZeIVgzbof1SeohklT9HL5DZxH2wZ2OqOgjsgPi8roAfoe9aM4cCMPr7cUn1y/APZ+icFmKka9njeBFAzI6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937556; c=relaxed/simple;
	bh=EFCjIcaEq7yAtTZLEjo4ZoV8N80XCu551gIsZVmsZU8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=hGktSN6N6ABPDAWwaPzHBbIb3TMSs0iWfFbBIuhbexpHSR3zg84wl1fCg4vVpEmtnR4zCW2sTCmxNiebT7y4EflVmpmxnHiecPVXUxZlCUK924v+hleJ6TZbmTuqmyy4DGOTGu5QCZmNeoopJsVOSYwXlrRJ8UAoBYnUmFdi07o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=vZltUv8y; arc=none smtp.client-ip=203.205.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="vZltUv8y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788937543; bh=EFCjIcaEq7yAtTZLEjo4ZoV8N80XCu551gIsZVmsZU8=;
	h=Date:To:Cc:From:Subject;
	b=vZltUv8yiYcII3N8Lth+E30KwS8tEUTgzFHli1eZh2J50WDpok8rwJbEmyYPzlZAl
	 i14uhdIK0242VgHR+4czBMyJQUqk8ezmiipW67sb45leO6/jOz30aQKKgGqPq5HJsA
	 uMY5CVNV8UM2lk5FumLSXk+h74Jl2b8ie4fWXxTY=
Received: from [IPV6:240e:47e:810:e56:b3e4:883e:9c05:2223] ([240e:47e:810:e56:b3e4:883e:9c05:2223])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 1691A0F2; Wed, 09 Sep 2026 15:05:41 +0800
X-QQ-mid: xmsmtpt1788937541tesyjh6y8
Message-ID: <tencent_A89516B196B5F3484ADDB96992501D676B09@qq.com>
X-QQ-XMAILINFO: MMq8nqC7jH0B1kgcxgCDDGWMYgsmUU+ZUxE6oFlHv1i9tX5ElptME35GVExf0o
	 4OMD8SJ7iul5k+wRapGQ99Lh5v+99yHk+mBxq+P0NiQeZgIzkNP1P1LAfQdyDSWo8hNqEwZT2GRI
	 81p8BJL1XZF5fHTqnaoxqvCSJPWo968gO0TQgNLQMUvLpinJm9Q1/B4XFHn/+tcodWjzCMFJ2HB8
	 JqJkheh1iHNnykCbgP3BeQOHFzN7SUTO5xCKSKtF+pqepdqN8DEf7WNSeyRciYZalQGDIuYbbMrj
	 sdGfFprHLgLVZtmkKOiisyo10BuDWjgjX+eVHGeldhoqvCpHUmGSUiD+URFzg3Mt2ddSclDF6tew
	 haDtXKvhwZ1voCh9LuzKGjACwWUlFiR1dyxCbjqew2YmG8w/pWuYD8ps7OuVC1XnE3UZMdAxqdUZ
	 ivG9c8pS5ov1vLwB4IawIOEEL7vIQKzAXUiOVRLXjiwgNptzo5aZFmlVNazmqi48A9wSG4/3WM6M
	 JHyAO2/QIN145AYpRxaEM6YVEZzAXcnuhxGarq4LpTG9jVLsJbhUcVj6VKdw9HK+46lPPn9kc7lH
	 8tqmq8iDP4rzqi3mFN/2Ys+4D7w+snYLP2h5Tb2bZu/52QdaB07QwhhpUAb0VeJMzBn2b96EzjvU
	 ZER7rnI1CXj7Bb77yjLsQqpDqVsrJOhDG6oQLHulpMqaLSAzbn+OcOqaYptqqM30pfeCGoyq0h1V
	 oJBi+7xKrRjWMNMGm9MBBIYmm2xetd/+vVOpRO4n65VzlN+uAWe0cTAfOr4rt1f4wPG6Q7z/Lweq
	 vv32ar5j9AH6z/3TbaQP8KLdS8z+FmN+XrNN/yQyqndoia+W/tvj9W8cXTCd311GPGbJpubNpObx
	 Pcq098D6sucmD7Yrsa2ghJUuecA/eL9H3Jnd2DZQWNelHvq/XRPIhkQ5RgFS2KcS9go9cLbAhVQB
	 BOaqp0082t/1N4gKdQIvxeA4rJWFKXBEfnVRWYfb4DJSK1fGptcydHFBbcSetnihXHKYzeSHOYQ8
	 A9qtSXbvc5OSFQLJ17gv40g5R+9ZfYNaSshDRgpBVlfxaA6pTD4saS1UTPlir0+5PJnlodPw==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-OQ-MSGID: <8fe5ce1f-456a-4dcb-9dd7-a8fb17633537@qq.com>
Date: Wed, 9 Sep 2026 15:05:41 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com, perex@perex.cz
From: =?UTF-8?B?5ZGo5bu65a6H?= <997536907@qq.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for IPASON SmartBook S1 (ALC256,
 SSID 0x2782:0x0206)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

The internal speaker on the IPASON SmartBook S1 (an Emdoor ODM laptop)
is completely silent under Linux. Bluetooth audio works, and the same
machine's speaker works fine under Windows 11 / Windows PE with the
vendor Realtek driver, so the hardware and amplifier are all good.

Root cause (found):
-------------------
The BIOS reports the real internal speaker pin, NID 0x1b, with
Pin Default 0x411111f0 (DefAssociation = 0xf, i.e. "unconnected").
ALSA's pin parser therefore drops that node at pin-config time: no
mixer control is ever created and the pin is never driven, no matter
how 0x14 is configured. Enabling 0x1b produces sound immediately.

The existing model=alc256-honor-mrb-xxx-m1020-audio makes the speaker
work because it is an HDA_FIXUP_PINS that also rewrites 0x1b to
0x90170110, but it additionally rewrites 0x19 and 0x1a with Honor-
specific values that add a bogus "Dock Mic" device that does not exist
on this hardware. A minimal two-pin override is preferable.

Hardware:
- Codec: Realtek ALC256 (0x10ec0256), SSID 0x2782:0x0206
- Controller: Intel Tiger Lake-LP SST 8086:a0c8
- BIOS init pin configs:
   0x12 0x90a60130  0x13 0x40000000  0x14 0x90170110  0x18 0x411111f0
   0x19 0x02a19040  0x1a 0x411111f0  0x1b 0x411111f0  0x1d 0x4067b945
   0x1e 0x411111f0  0x21 0x02214020

Proposed fix:
-------------
I do not have a kernel git tree at hand to produce a proper unified
diff; the two hunks below are the exact entries to add. Please let me
know if you need a formal patch.

     SND_PCI_QUIRK(0x2782, 0x0206, "IPASON SmartBook S1",
                   ALC256_FIXUP_IPASON_SMARTBOOK_S1),

     [ALC256_FIXUP_IPASON_SMARTBOOK_S1] = {
         .type = HDA_FIXUP_PINS,
         .v.pins = (const struct hda_pintbl[]) {
             { 0x14, 0x90170111 },
             { 0x1b, 0x90170110 },   /* the real internal speaker */
             { }
         },
     },

Verified on kernel 7.2.0-1-MANJARO (also reproduced on 6.18.45-1-MANJARO),
in both the SOF and legacy HDA driver paths.

alsa-info output:
https://alsa-project.org/db/?f=4c555d942f5cef14cac55e34b2236238ae909af3

Happy to test any patch and provide further hda-verb dumps on request.

Signed-off-by: 周建宇 <997536907@qq.com>

