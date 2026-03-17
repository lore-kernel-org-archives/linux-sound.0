Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73112364925
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 04:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773721357; cv=none; b=UY7wdW3MvE5lN3TpE/q3lw+Nk5fdEr27ziyju7KCz8Y/QnvpuKq3G70a/N2rw0Zp8QugQsWXi7ORA6AYj5hSGzOdGoijhaPVMA4piVkCBoohzlka+7Z7f02E92U77N0DscC9b5XlyJeJObpaG7vWdpk3eoobRLLHWIiXLWHYvjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773721357; c=relaxed/simple;
	bh=6DzbO4Ml1aHb3e7Sda0Z2wIyPUN3e5Y8nB2T9Ja5BYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=clPhtTjnyek1DCNrdbyG71SjuFlyekh/YIyDBWVgbBmQJbt/cTH00FkVxkdF6Ywwfeo0L+5qNzoLN9HkuITmH/JAwht+W2YgU6WhIniN0YcmSxYlxVSn87i4y7J9PkT77FGg/vIaWRjqAux2s4TdJ2Agkizuna64lhE30f5/Ryo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XiHX7FOk; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiHX7FOk"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-128ebee22caso3210197c88.0
        for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 21:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773721353; x=1774326153; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NbNGfKsBjjjuyphN4yp+QwSP8eo9AaRUsQZLKwzJdEM=;
        b=XiHX7FOk1TpEtw5BBENjN5R5OVa6XYyUQSXB6QrzFn71XWClOoKBqQjPZkO6JGMAPj
         +4SGnRb3Xs5XIDDl9frE00M+MPtd8BMesunVXntsReaXaVlVEz68nyAP2B5+aSzPAsmX
         YDSgG0badPp4lNgKHCZFVVCdEhQURKnYhokparstxPF3tpxl7BdbA8oO2pPFXA2JN50h
         pnrTSjlf+OTiqIDbEL47s0eRHgws7XFBdADqrE3Fdn5dg3lvQ2CqokkJhCNosOZXe7zY
         3f/ZfUqziuxz9elv87bj2XAu2R8nWxN7q7q7f50cDixuToLlMP52hsZFZYdhUcl1hTra
         rPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773721353; x=1774326153;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbNGfKsBjjjuyphN4yp+QwSP8eo9AaRUsQZLKwzJdEM=;
        b=AoI2GkJ3vKbdw91ejpSD3pL+NGmA/UL03+hrWTiF8il+tt+ae2VRchRTfjlwuC21tj
         eZY+wBkRnovGTJa6m042RnqMDZsZXeWWkqVcQnJF8jlmVClqcqDF0oweq9QYErnVWj7Y
         YPxzExFZuCUTIfd2WJkjPIrOsQdcp7ODH2PEpHfZcTBnEwQ0dm9VAaOd46CDHavZBa4Z
         IoljiTNYrwK12dSt9ckR3NTODADaqLZhDDiWYpSFA6vQPHcY46Ln7T0nmP6S5znk+dVN
         0FfbmrxnTM+FIizBodfAypK3NLC4MZpg8Tz33JQzoT5GfdIbYuaC/8WFzag1sYf4201Y
         vyUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgmzMm5Ah36Ym2CRXkxkfqo8hbeHnKwa5QSOLThuQJcMIlkWPhWGny3TQ1ynNqwIPkgK0ZSsC3X0SFwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy04RQc2db49OruEXvShXLUJdK5P/OVQmN+JPiygRJWUEDnydHH
	Q9ngquChPVYquLPXivxeq9PHH/zjvC7xOwPX0Yehd6njLjSzRYiESCJc
X-Gm-Gg: ATEYQzxni351+a+TBq3bWoc9IYg6KM3aRfpt7WB1GAJtelZrSlHVrlikFkdMJh/bSFQ
	4e25wDfz0VueL0B9BZjre79u62yDhMIj9opOtVJi0PRexVFq1f6jKPF3YahOTYjLFv6Gebe8VM9
	DpWx1miyzFuv2dfMHeCimPYRfFqpDBIqW87dDqIFck7Wx+Eit5n0jreTywWO33EdcROex2cNE+/
	cLw3vaTbg+0Nl7RKM4Ik9b3Mb1dGk7HZGLAF4uH/eZQwThfnK4txlBj1Ft4K5cPUv4HmprkoRvA
	QTPf4I+VBF0Tq+8+lbvam7LcKcYgjWFKe80pIbRB/Rd+6wJ5gtrL7UMOU2BpaMtaAsw/ohGshgn
	dyhgHQXhkosNo6xe19UijShrggt4ycNNSwVTfStLrfeVWWWw35SHU+M/sZRJuJ3Y3odI4eFyD5/
	C4gXvFKkP2rGJWiD4Kuazv696SOaICS4cUV0viUv9sdpXI0x0mG1CEDNzQ9bZAgu98wXm46RlP2
	8JU
X-Received: by 2002:a05:7022:301:b0:127:33e0:ea44 with SMTP id a92af1059eb24-128f3e1a5b1mr7993213c88.29.1773721353075;
        Mon, 16 Mar 2026 21:22:33 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128f6295ebfsm14583318c88.4.2026.03.16.21.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 21:22:32 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 17 Mar 2026 01:22:04 -0300
Subject: [PATCH v2] ALSA: usb-audio: validate full match when resolving
 quirk aliases
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260317-alsa-usb-fix-quirk-alias-v2-1-6e531c67f0c8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNSw6CQBBEr0J6bZv5GGRceQ/DooEBOvJzWoiGc
 HdHEpcuX6Xq1QriA3uBS7JC8AsLj0MEc0igbGloPHIVGYwyqbLaInVCOEuBNb/wMXO4x4hJ0Ls
 ys0oVlNkU4nwKPlZ29S2P3LI8x/Denxb9TX/S03/polGjNalzLqvPVNG16Ym7Yzn2kG/b9gHVn
 m6kwAAAAA==
X-Change-ID: 20260313-alsa-usb-fix-quirk-alias-e9c8300ba836
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5086;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=6DzbO4Ml1aHb3e7Sda0Z2wIyPUN3e5Y8nB2T9Ja5BYI=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJk7rrN9v1Jj+COX62ziN5NbNxa+0fsucCb0o2Dg/VN+k
 3W/O6SmdpSyMIhxMciKKbKsTlpkuafrwdX6uBUeMHNYmUCGMHBxCsBEgn8yMpy0u93Atk1oQYpV
 5FaNOa0KNiF3JRZEqi959/ag5TlV8/WMDAvOuBRWSvYfdj8bt1QyaoXRissnJkfPnC/+ZW6l/fG
 IywwA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

get_alias_quirk() resolves a quirk for an aliased USB ID by scanning
usb_audio_ids[], but it currently checks only the vendor/product pair.

This is weak for quirk table entries that also depend on additional
USB_DEVICE_ID match fields, such as device or interface class,
subclass, protocol, interface number, or bcdDevice range.

Rework the alias lookup so that it still uses the aliased vid:pid as
the initial lookup key, but validates the remaining match_flags
constraints of each candidate entry against the real device and
interface descriptors before returning the quirk.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Changes in v2:
- drop the temporary usb_device_id reconstruction approach
- validate only the remaining match_flags explicitly
- pass struct usb_interface * to get_alias_quirk()
- Link to v1: https://lore.kernel.org/r/20260314-alsa-usb-fix-quirk-alias-v1-1-3269998f7ada@gmail.com
---
 sound/usb/card.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 64 insertions(+), 8 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index fd81f32a66fb..153085a77d43 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -864,21 +864,77 @@ static void find_last_interface(struct snd_usb_audio *chip)
 	usb_audio_dbg(chip, "Found last interface = %d\n", chip->last_iface);
 }
 
+/*
+ * Match aliased vid:pid first, then validate remaining fields against
+ * the real device and interface descriptors.
+ */
+static bool snd_usb_match_alias_entry(struct usb_interface *intf,
+				      const struct usb_device_id *id,
+				      u32 alias_id)
+{
+	struct usb_device *dev = interface_to_usbdev(intf);
+	const struct usb_host_interface *alt = intf->cur_altsetting;
+	const struct usb_interface_descriptor *intfd = &alt->desc;
+	const struct usb_device_descriptor *devd = &dev->descriptor;
+	u16 bcd = le16_to_cpu(devd->bcdDevice);
+
+	/* Match aliased vendor/product */
+	if ((id->match_flags & USB_DEVICE_ID_MATCH_VENDOR) &&
+	    id->idVendor != USB_ID_VENDOR(alias_id))
+		return false;
+	if ((id->match_flags & USB_DEVICE_ID_MATCH_PRODUCT) &&
+	    id->idProduct != USB_ID_PRODUCT(alias_id))
+		return false;
+	/* Match real device descriptor constraints */
+	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_LO) &&
+	    bcd < id->bcdDevice_lo)
+		return false;
+	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_HI) &&
+	    bcd > id->bcdDevice_hi)
+		return false;
+	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_CLASS) &&
+	    devd->bDeviceClass != id->bDeviceClass)
+		return false;
+	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_SUBCLASS) &&
+	    devd->bDeviceSubClass != id->bDeviceSubClass)
+		return false;
+	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_PROTOCOL) &&
+	    devd->bDeviceProtocol != id->bDeviceProtocol)
+		return false;
+	/* Match real interface descriptor constraints */
+	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_CLASS) &&
+	    intfd->bInterfaceClass != id->bInterfaceClass)
+		return false;
+	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_SUBCLASS) &&
+	    intfd->bInterfaceSubClass != id->bInterfaceSubClass)
+		return false;
+	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_PROTOCOL) &&
+	    intfd->bInterfaceProtocol != id->bInterfaceProtocol)
+		return false;
+	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_NUMBER) &&
+	    intfd->bInterfaceNumber != id->bInterfaceNumber)
+		return false;
+
+	return true;
+}
+
 /* look for the corresponding quirk */
 static const struct snd_usb_audio_quirk *
-get_alias_quirk(struct usb_device *dev, unsigned int id)
+get_alias_quirk(struct usb_interface *intf, unsigned int id)
 {
 	const struct usb_device_id *p;
 
 	for (p = usb_audio_ids; p->match_flags; p++) {
-		/* FIXME: this checks only vendor:product pair in the list */
-		if ((p->match_flags & USB_DEVICE_ID_MATCH_DEVICE) ==
-		    USB_DEVICE_ID_MATCH_DEVICE &&
-		    p->idVendor == USB_ID_VENDOR(id) &&
-		    p->idProduct == USB_ID_PRODUCT(id))
+		/*
+		 * Alias lookup only considers entries anchored on vid:pid.
+		 * Additional device/interface constraints are validated separately.
+		 */
+		if ((p->match_flags & USB_DEVICE_ID_MATCH_DEVICE) !=
+		    USB_DEVICE_ID_MATCH_DEVICE)
+			continue;
+		if (snd_usb_match_alias_entry(intf, p, id))
 			return (const struct snd_usb_audio_quirk *)p->driver_info;
 	}
-
 	return NULL;
 }
 
@@ -927,7 +983,7 @@ static int usb_audio_probe(struct usb_interface *intf,
 	id = USB_ID(le16_to_cpu(dev->descriptor.idVendor),
 		    le16_to_cpu(dev->descriptor.idProduct));
 	if (get_alias_id(dev, &id))
-		quirk = get_alias_quirk(dev, id);
+		quirk = get_alias_quirk(intf, id);
 	if (quirk && quirk->ifnum >= 0 && ifnum != quirk->ifnum)
 		return -ENXIO;
 	if (quirk && quirk->ifnum == QUIRK_NODEV_INTERFACE)

---
base-commit: dcf16b3bb87632a80ef344433980539c2785dfd4
change-id: 20260313-alsa-usb-fix-quirk-alias-e9c8300ba836

Best regards,
-- 
Cássio Gabriel <cassiogabrielcontato@gmail.com>

