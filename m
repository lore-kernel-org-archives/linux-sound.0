Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134D83859FD;
	Mon,  2 Mar 2026 18:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772477977; cv=pass; b=SaxK2/gc0XdBAsshZ1ZqVzZDHD8q+B90FjjVBopDnLMJW4rMxzIGNAMhuHQVCd861EzZIU78PNFcqgVbzJUPowjaWMCzrc6PFRjKfnSlENkuk35FM8Sn3MtzW4toTGvH4/7TkUdYWQYqx3/s5WvrpYBSW2OToOYdQHSK+ffkn+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772477977; c=relaxed/simple;
	bh=E90wE1wuk4q4Njnn47OTbEtjKUtAuOq3F6cInIdE8Rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uOSrccauFBes6AeB5V/WhAzWIOY9XJNQNOt+rPDtS877kgzwxmmPd6Zmst/i8/pbHLgAqzdxY8SgMPN6HiezL21DmgZasiz5yTbcoGWBFTZVdrr7pLxJv7Ib14Mle/QfhIDWu6OCtiKKVK7Tdv5ZCj3KLmHhOAvvwHPLC9mVg7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=qshaKfVa; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="qshaKfVa"
ARC-Seal: i=1; a=rsa-sha256; t=1772477963; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Fk+PViuctFmzl4E29n73RX5qEl+I3CegOvnEEeFK5GdgwBkE/xwEZvhbFtNbbrYgiEWeIqlHz7YRskrTBPkF49uK/QEe7wOzE8n/j0RS2LktBlpbN1shKsJ94h7e4gW47MpcDLn3HuoOCanmtYv9jiOnA7/2o+JDvmBhVqp7hJI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772477963; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8ZCcQUb9VW8DjR9aznsCaYh+9K7iFtDmGRjmJ8Tn9pw=; 
	b=me0/ZCjGFpzpGBHqpU1Mn2ZtxyR8TjR28ky1DR8SRH801Y/PjjPoNQuyrgmTh25IzSnKU4/FIg4rXlAj1YxR4vy1wfGt7+omGHDi8zyNL0wUpZEmSvhmFmMO3IpV4kf+VGbBTJn36qtMoRWai0vAMa5Gy18XMPfQ8rwTIgNwnas=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772477963;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=8ZCcQUb9VW8DjR9aznsCaYh+9K7iFtDmGRjmJ8Tn9pw=;
	b=qshaKfVa2Jt8DycIzyA6SOrnd+7iEaHo5cBt7yo/rQ+xC0MwBZEX+R7e9n16o6pW
	0W+PbqHLJw6BUmjwBrEzuI87qPZvUklAE8NYPNxk+dQSQumUMqEq9G+GxgO1XXQj+uI
	yCXV/yVxgruHimudooMdDOovlfWC508VtArTt3LBYC/0iIr6VY7xWVBDWoEYl1Jm+43
	FRt6R+rgvwwkLA52z1Om22tiQ07wm1kEtzfHyeA7r5HXLMDwTWIdyAGkW+Fs5CCT3fg
	nfu4lotkrFYuDXoyWcBw3parV/rJf/gdEPG7FW7ghs+ZhMTHMBzbvDljJ+OsVt6p/Pf
	PNwV96dKiw==
Received: by mx.zohomail.com with SMTPS id 1772477962321798.6615877962031;
	Mon, 2 Mar 2026 10:59:22 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Rong Zhang <i@rong.moe>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	Arun Raghavan <arunr@valvesoftware.com>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 5/8] ALSA: usb-audio: Deconflict VID between Focusrite Novation & MV-SILICON
Date: Tue,  3 Mar 2026 02:58:56 +0800
Message-ID: <20260302185900.427415-6-i@rong.moe>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302185900.427415-1-i@rong.moe>
References: <20260302185900.427415-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

MV-SILICON is a SoC manufacturer producing multifunctional audio SoCs.
Many budget-oriented OEM devices are built on top of them. However, some
of them are just too budget-constrained that their manufacturers didn't
even have a USB VID and simply picked a random VID.

Some OEMs unfortunately picked the VID of Focusrite Novation (0x1235),
resulting in VID conflicts as we had defined a VENDOR_FLG() for the
latter.

Add a VENDOR_STRING_FLG() for MV-SILICON to stop the matching procedure
for these quirky devices, so that quirk flags for Focusrite Novation
won't be accidentally applied on them.

Quirky device samples:

  usb 7-1: New USB device found, idVendor=1235, idProduct=0003, bcdDevice= 1.00
  usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 7-1: Product: G1
  usb 7-1: Manufacturer: MV-SILICON
  usb 7-1: SerialNumber: 20190808

  usb 7-1: New USB device found, idVendor=1235, idProduct=0003, bcdDevice= 1.00
  usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 7-1: Product: mvsilicon B1 usb audio
  usb 7-1: Manufacturer: MV-SILICON
  usb 7-1: SerialNumber: 20190808

  usb 1-1.2: New USB device found, idVendor=1235, idProduct=0002, bcdDevice= 1.00
  usb 1-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=...
  usb 1-1.2: Product: V8
  usb 1-1.2: Manufacturer: MV-SILICON
  usb 1-1.2: SerialNumber: ...
  * https://github.com/linuxhw/Dmesg/blob/main/Desktop/Others/Intel/Intel%20X79/96ED1CC44499/LINUXMINT-19.3/5.0.0-32-GENERIC/X86_64/5BE1E4C74C#L1122

  usb 2-1.6: New USB device found, idVendor=1235, idProduct=0002, bcdDevice= 1.00
  usb 2-1.6: New USB device strings: Mfr=1, Product=2, SerialNumber=...
  usb 2-1.6: Product: V9
  usb 2-1.6: Manufacturer: MV-SILICON
  usb 2-1.6: SerialNumber: ...
  * https://github.com/linuxhw/Dmesg/blob/main/Desktop/Hewlett-Packard/ProLiant/ProLiant%20ML110%20G6/79B1D707316A/KUBUNTU-21.04/5.11.0-33-GENERIC/X86_64/A43F59C4AB#L1009

Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 8deeb9d247500..c5b89d7964b48 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2440,6 +2440,9 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_ALIGN_TRANSFER),
 
 	/* Vendor and string descriptor matches */
+	VENDOR_STRING_FLG(0x1235, /* VID conflict with Focusrite Novation */
+			  "MV-SILICON",
+			  0), /* Stop matching */
 
 	/* Vendor matches */
 	VENDOR_FLG(0x045e, /* MS Lifecam */
-- 
2.51.0

