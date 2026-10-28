Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153197;
	b=E8nbVFswBuMWntq0E1V/bqOjmRcM5//fzATyEZAEac+PjL/ha9S50qmEhcaX2U6FNihG
	 d1rvCsHccGgMR3tcIVmyOwfcrbSp5nUsoIYdV+TBKd5S7OuZI5FNf7DvMhRiD/qStsjG+
	 HqiqjXDZ4HKiAskN5MLZtOuKASWObQ6nroKcK1z16eQcddr4dBC8t86JNBUkHdjgN8prH
	 L2ySICnMlFMl/5NEllfy9TfeHWG+WH8/0sWCcmfRUmKZFp21lldh08CgOt456M5ZcmjYE
	 /XwfdY3NQOY22ApmS+vBOXylFL5cERCoVWVG5ZosS/Rfg/+VZcmsC1e7EqwZR2pTEVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E0eV56cTNymI3e3+gujW/3RFeyU52ZaDbouK7jcTvy0=;
	b=r/skbMcFO1HPaQlS/PUkOwyKGfpnfWw5HO7CUqxPSCXkpKUYIeB0wGnePc6VJnMZ0cZ4
	 VFsC9paLVHCV585hRQ1wZgMLmkRN8icCThOSB5KBeomHwmIDVwiqA9nKldo/WqdSnb1zG
	 m/HUhDhzKBT3jZURVAcnOix759Q43y56xMK8Rg7Ex5inczFymKvn4HjSINh1zL3dbecJh
	 n7C21hSSULg/x4e+rfbYfht9RBz2RtWn1PGpCFavYI2jV20qvPuPwsUhHuPxmVQD3uHtt
	 bziCp6QAvEwvyPiYDoKgSOEgkVcI5R4PmiL3LhEdwxn4E0I1pRShUE4BjtB8meoUH+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zssoj7NS;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F97D606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F97D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zssoj7NS
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8451a619da7so369088a34.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 19:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153196; x=1793757996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0eV56cTNymI3e3+gujW/3RFeyU52ZaDbouK7jcTvy0=;
        b=Zssoj7NSlPLO7bH7c4LSZvHqF6jNxmaux9wQ8vSWMsIAYjyOsWm7MJxZ3Y8Ja0vPJS
         S2vceaSRypar2g9n1GQ9UN/xHwPA9lB0VmcDs7MAvL2fSIC/TQcOQnAmlWJFS0Q4c+R9
         mCc3pADhivRXuYgieUYywdb6hKNJu7xv7US5DHHtGGWBMlf7n9krp0kJBDtgEd9kpXKU
         2iaH4jKGfAYa6mQ181cGjwXdiJ/buAKK5Jfj84L9bZF65wmh/YM739ta3+RzzzTFoN2+
         fywWA2K66qIgQLSoeOFIFFY+9ckQIAtz8gHDxgZGcpsCTmZaC5mTnOb2/ia08oFZa9/3
         n7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153196; x=1793757996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E0eV56cTNymI3e3+gujW/3RFeyU52ZaDbouK7jcTvy0=;
        b=C2T77oKHp0qF8krCulHN08lGGsRWeS5ZwOl3CJsKQEGiMYEsHU3nflTTEoooe+fRgt
         ILVvbMIgngVrldkhIdrmDIBQHaP3+nlRGAu2nebtpYVzrZo0dYyZOxJAUHEPSxmquQX0
         bm5NrvAJCED6K7mHpn0nMOZIgeRlMQTWMPxhjygjdESNjKsk0zh8IVLYYicF5Ohcb6+E
         RwYyiNxRgrNkl2nog+xEiw7xkMVu8Qti9uI6DF0CJeaKSPYo+gtThpOTTY7Gz/MkCbMh
         gd0eVqo+zJgVDG6BN+ilSVqOljDFeR8/CwbXhtsplG+9CuzgBoCSoktgSBcZU2cpLa1H
         BgRw==
X-Gm-Message-State: AFq9FYKN0+1oUFNWD3kuGYoDzecj+7GEG92WLGdRM+xgOSyV7hUroLYT
	B+Kok11fIQaNa8MTpK9YBiWqnx3AOaH08c6l6DB/J4blEf4+PNn/3vFKT8uE1ZAa7Ow=
X-Gm-Gg: AYBFou36KyZoAD53nC54/Saqg3hMZ5cEFpXkoyW1rqMI3BYK57FldtrtJa1k0Ec6mgR
	YFdDB4C17lUukdWkD3vvsHwZiTsGuZ4LmbB6weBGlKpyblZ5aok7m4RsZgGKbYjV9feWsGMMdwT
	iNaNr7iZDIE2af+KjSpOro7c6HJmP8mowHY6nj0J565CUHPob6cmcwvjsBCR4oFN/F03kNNEGD2
	f2D5TQJrlblahvRXIXGWFF1H8qlZVNcEYzD8jKU7FEST6+ZRIGvWOh8Wioy7i9Cx4/jr7EJwIax
	Db+7+guzB5Ql9XQZxmo7D8Aq0Zc7oYSz5oU/9zxXyDBAechhvXrbCoTTmcksqZPTtkiO6dcRWtF
	lhfjudRT3eZcQG/j12oWyQvZS/Jqwylw16uGgkbbnqJEbJpd0kmMDXCx6FXE8Rr/TFH8X/duNiq
	Bhq8ljkdK0xr5UEIgZ/iN5q0kdQxuYsDvuEhtQ1u6KflSz33QIC7saWgk1WE1CehSUHJdD7MS0o
	53wnNKGLJbbf1QlI8T7jJn8UwzEiyTS7Pk1Phn7ELFvcqHfeGsgZZopcyrest4GvKp93jJPI69F
	M2l2FwIgHQvJT+tKdvC++U/EfeeBwhgEjEJ4fDtzE2+vUYSD11aqfLKAnmGKrASqsBn+MCd/j/1
	MhcZbafCv56bQ/ardUdb5Hna/8s6pTciHJl4cEBrkfF4=
X-Received: by 2002:a05:6830:4ac5:b0:824:e29:e00e with SMTP id 46e09a7af769-85ab929b937mr1271215a34.20.1793153196465;
        Tue, 27 Oct 2026 19:06:36 -0700 (PDT)
Received: from localhost.localdomain (162-233-222-157.lightspeed.livnmi.sbcglobal.net. [162.233.222.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1d363390sm355217a34.1.2026.10.27.19.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:06:35 -0700 (PDT)
From: Corey Smith <corsmith@gmail.com>
To: corsmith@gmail.com,
	Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 11/11] soundwire: amd: provide defaults for the bus clock properties
Date: Tue, 27 Oct 2026 22:05:52 -0400
Message-ID: <20261028020552.35278-12-corsmith@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028020552.35278-1-corsmith@gmail.com>
References: <20261028020552.35278-1-corsmith@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The manager clock configuration was moved from hard-coded values to the
MIPI DisCo properties (max clock frequency, default frame rate and
default row size).  Rembrandt (ACP6x) firmware does not describe those
properties on the SoundWire link nodes, so sdw_master_read_prop()
leaves them zeroed and amd_sdw_clk_init_ctrl() aborts the manager
start-up with -EINVAL.  On the HP Dragonfly Pro ONE this makes the
whole snd-pci-ps probe fail with error -22 and no SoundWire device is
created.

Restore the legacy defaults when the firmware does not provide them:
a 12 MHz bus clock, a 48 kHz frame rate and the 50 x 10 frame shape.
Platforms whose firmware does describe the properties are unaffected.

Assisted-by: LLM
Signed-off-by: Corey Smith <corsmith@gmail.com>
---
 drivers/soundwire/amd_manager.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 697ec93..d451428 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -25,6 +25,12 @@
 
 #define DRV_NAME "amd_sdw_manager"
 
+/*
+ * Frame rate used when firmware does not describe the MIPI DisCo clock
+ * properties on the SoundWire link nodes.
+ */
+#define AMD_SDW_DEFAULT_FRAME_RATE	48000
+
 #define to_amd_sdw(b)	container_of(b, struct amd_sdw_manager, bus)
 
 static int amd_sdw_clk_init_ctrl(struct amd_sdw_manager *amd_manager)
@@ -752,8 +758,27 @@ static int sdw_master_read_amd_prop(struct sdw_bus *bus)
 
 static int amd_prop_read(struct sdw_bus *bus)
 {
+	struct sdw_master_prop *prop = &bus->prop;
+
 	sdw_master_read_prop(bus);
 	sdw_master_read_amd_prop(bus);
+
+	/*
+	 * Some platforms, Rembrandt (ACP6x) in particular, do not describe
+	 * the MIPI DisCo clock properties on the SoundWire link nodes.  The
+	 * values read by sdw_master_read_prop() then stay zeroed and
+	 * amd_sdw_clk_init_ctrl() fails with -EINVAL.  Restore the defaults
+	 * the driver used before the clock configuration was moved to
+	 * firmware: a 12 MHz bus clock, a 48 kHz frame rate and the 50 x 10
+	 * frame shape.
+	 */
+	if (!prop->max_clk_freq)
+		prop->max_clk_freq = AMD_SDW_DEFAULT_CLK_FREQ;
+	if (!prop->default_frame_rate)
+		prop->default_frame_rate = AMD_SDW_DEFAULT_FRAME_RATE;
+	if (!prop->default_row)
+		prop->default_row = AMD_SDW_DEFAULT_ROWS;
+
 	return 0;
 }
 
