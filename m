Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD7E23D7D9
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760414519; cv=none; b=afWXYuqwxVP4GGKGZ3u53it5yP1WY7hz6Py/8U4T6QHs+PTb5VNDctlcvDB5eOsPo+tAwoFv/I5Rnz6XKvDC+KPdinnqiOTer97kXKhmm9FInEixklsikMoxrJTG6QmXRr4Ly234k/1I2ittOXoy8wrOqlBctPXqAHtw5JEGYg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760414519; c=relaxed/simple;
	bh=6rKEi5rVMoICrmlvGRwYms/LqfiAGgM+OUJeZoAy+hU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fwV/czdHBRBO3vYLuRQ5pTHfDi9OIYSAF2BCHIX2yJF/EwQPKmk5r3k0u1Y6rXsOoVIyMr9u/8qvCYj3m847+fdDc/yi3m0VXzQqGZ06zSh2aL0QHwXMvPp73hyNM0hEyT+fkkkR/VI3SJE8ZtYDLKkaFql/BV3/J+mabmJ0LuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOPlwEpj; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOPlwEpj"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7810289cd4bso4649462b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 13 Oct 2025 21:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760414517; x=1761019317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsB0izycZm3OO4+5XE/3dmw7Fn4MStV5GzPqI2plKC8=;
        b=SOPlwEpjI4nGte158TcRP4ZAEKhHLaV0Ivnjt/7QcwyntDWzwWu9vZ9mTajkSWFiKL
         UCT1pIaqrH9cGKsdnY60PsMPTazeaBzgGGE5TrFRX0yyn9d72Jw76gUB/g7bQMzzTKTI
         zb5vpu7IraTdzfEo3I9pAXZTfC/SriJKvtuQszrL887ychpm8tJYV/x8qU3cRCWeZ+hK
         0cLgVwYN3LnUCIbgXQk+/1QMtSImT41xrFy4NbpSTjFbMbAqv/SgGL+54PHO8H7aAs7N
         JEm1daD0Wa1LoVY4+Orc69rPMEZKsLEyCjJPpDAVnPPBtqn2HsQXPyCnHb2RidBdCEg0
         h6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760414517; x=1761019317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bsB0izycZm3OO4+5XE/3dmw7Fn4MStV5GzPqI2plKC8=;
        b=P0kHa8QpuonJgB9dNfGyuqbng0IdL1ZqDnwGy6OVxxu88/Cxq0OH+JhsDge8jYgOLE
         9KDaHvd52M7XjC8YdVhnYVTT8RzKph/Us91BVHSb7Gqd+nOTOs4l+ssusi5BOtkDxj5G
         ItvtxA5NUBO2t8LT66oZagv/l8MlcpRnZp9+ZOsoMBZalXQIEwS2ecNsdbkwxYhocflE
         TNhenLZxY+r/tSVqK6oPId7dKgfv3oL5EIYGHKcCVne9ThXtuj5p4AlNPR97Lmpdaftb
         skTlzzD3ujyavGkI0WKYQhwKrxL5MPb+SvOfnd/X4I4BuFMTOu5+GAl2xVzVxNaEeLLM
         Z0mw==
X-Forwarded-Encrypted: i=1; AJvYcCUox/+hqDbKAZPD/tiX160R9hSqwwu0FsX35cczGRgtp4U0bVXMO2YDAfYTNiDr9JbXHdVnIQM8Swh0Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyquP9YLYHu4zMW383bX61aW5GSr9scMOMp3SyXW17IJn5RL7Cj
	JRtCokbIYBGyOb20TvL7EQ832gyOwiZkciWRpknGckknEtjH9oYa6tWk
X-Gm-Gg: ASbGncvmOufF3vv5prtC+5YXQuKvqsc2B8x58JLPKn4sNnywoFvTyid5yQsf/4AxfLL
	xuWEnOBFFU7bBaJADhl2iOd1vpjlaflSxw9rztDWJk/W+iLvGXzFPJ2cX/iBpMaaCBsmIPUPSed
	HJ5nlmFoy0Gdi/9ENxp8G80DTP73yXn0KMRVK8zj7YeaaMiHMR3b0B4nBh0oBpRrRkZDtceI9i3
	raMfSYW71FHnSGXRc6l4oBtugohD00JTeWQQBTUM1vhxd8Ao447tFSSWvEpMJojFDBIkrH6yCbg
	THWazwDHnxb97hRerbOdUeQeT787ypUTSX1MUpTbcX7y8+tgwlIdFuTpVD3lu8kMobTxOkaIWwK
	Dd0ejd39PXfhU6ZIvmrIXS3Lzrsm3dGX1XCzmhrX0eLY5Gm/ZpA+l
X-Google-Smtp-Source: AGHT+IFrtfF17eWlEmSsbrrCEoLlRLW+h84XvFQh9e46H8cF0iymlCZDGFzyK4npmcVJn/1/I4iB5w==
X-Received: by 2002:a05:6a00:2e13:b0:781:1771:c12c with SMTP id d2e1a72fcca58-7938269d8b7mr29748487b3a.0.1760414516006;
        Mon, 13 Oct 2025 21:01:56 -0700 (PDT)
Received: from ustb520lab-MS-7E07.. ([115.25.44.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09a87asm13378751b3a.46.2025.10.13.21.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 21:01:55 -0700 (PDT)
From: Jiaming Zhang <r772577952@gmail.com>
To: gregkh@linuxfoundation.org
Cc: broonie@kernel.org,
	cryolitia@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	pierre-louis.bossart@linux.dev,
	quic_wcheng@quicinc.com,
	r772577952@gmail.com,
	syzkaller@googlegroups.com,
	tiwai@suse.com
Subject: [PATCH] ALSA: usb-audio: Fix NULL pointer deference in try_to_register_card
Date: Tue, 14 Oct 2025 12:01:49 +0800
Message-Id: <20251014040149.1031348-1-r772577952@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2025101225-lisp-monkhood-af34@gregkh>
References: <2025101225-lisp-monkhood-af34@gregkh>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Thanks for the guidance. You're right, the root cause of this issue is
that a USB audio device is created without a proper interface.

To fix this issue, I added a check for the NULL return value in
try_to_register_card() before calling usb_interface_claimed().
I have tested patch with the reproducer on the latest version (v6.18-rc1),
the issue was not triggered again.

Please let me know if any changes are needed.

Best regards,
Jiaming Zhang
---

In try_to_register_card(), the return value of usb_ifnum_to_if() is
passed directly to usb_interface_claimed() without a NULL check, which
will lead to a NULL pointer dereference when creating an invalid
USB audio device. Fix this by adding a check to ensure the interface
pointer is valid before passing it to usb_interface_claimed().

Reported-by: Jiaming Zhang <r772577952@gmail.com>
Signed-off-by: Jiaming Zhang <r772577952@gmail.com>
---
 sound/usb/card.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 1d5a65eac933..270dad84d825 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -891,10 +891,16 @@ get_alias_quirk(struct usb_device *dev, unsigned int id)
  */
 static int try_to_register_card(struct snd_usb_audio *chip, int ifnum)
 {
+	struct usb_interface *iface;
+
 	if (check_delayed_register_option(chip) == ifnum ||
-	    chip->last_iface == ifnum ||
-	    usb_interface_claimed(usb_ifnum_to_if(chip->dev, chip->last_iface)))
+	    chip->last_iface == ifnum)
+		return snd_card_register(chip->card);
+
+	iface = usb_ifnum_to_if(chip->dev, chip->last_iface);
+	if (iface && usb_interface_claimed(iface))
 		return snd_card_register(chip->card);
+
 	return 0;
 }
 
-- 
2.34.1

