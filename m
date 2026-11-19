Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795049561;
	b=fAJqwHXbhHiSQbHyU1bPLqhEfCcvRMnQfTtxNHP7yvyZKI8Jc0WkVEFOgkqJcxGfAn51
	 UiUAX7OPA3/buf8uOd30TN51SuB40zG64EfeWd1LcNts8iZYeyA1h0qWo+xoCa7ra8MPi
	 symWykbkrbtnmuEEjqzUvPvfPyxYrGfXVljQVcrjqWLVr9mZXx5YCWWAJkM1YjFyD819H
	 jQLc5efKMmGt2YZMsQfgfZ80nfM3MwSrDwHmfLD1ooPQZg+Hf4rGvNl2b81SudVnD378I
	 4pF/1e1ogoh1k67Meru2If4TPDrIqhV60bBuEvrTYYrUW12fZz5KENy3k968lNL5poA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=nymuC/5fpi5YK3jj3hRmkBJgLlOLdb1iU6gNf70BLcg=;
	b=Qk4FHfRYne5HfP2HHjAJtCo1GZX/b9mcrEiVBB6RRjTkjO9l9/4h5H0x8cP/LJ/w1UOu
	 J+0H640bcKbdlVbROwOuJeM2Lz3YLScboIiHOoZAXS6zTxM+N7OqbWZLbG+uBsiahlyL+
	 gLM9d0P5wJJtPYwUWSYLWUzxokl3nvtVUL8Y9zOs63g4PJOPchjI+S5p7sVZqZ7VfM87c
	 w72A+/EJ56kV+RGUWzaOAMy8ZEnNWpi70c475/scoX/xYf8Xu00yuU82Wcu7ML19ZnI98
	 G5RHBMJ0l9c3cE/PzW0Dem+o9rv1PzAdeqDbhrc9S5sWJINLprPVqqrBMZHfAN6MWjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Iq316Y0b;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45F3606A320
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 00:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E45F3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Iq316Y0b
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9495d543b91so110183385a.0
        for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 16:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795049560; x=1795654360; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nymuC/5fpi5YK3jj3hRmkBJgLlOLdb1iU6gNf70BLcg=;
        b=Iq316Y0bGlG+Icqd6RlOOuDf9DVXgglC1lbVWj5XkNFRNyBPF0VU2Uk4yLsX227t/i
         30m+0cYjgW3Y5k4GdEpqgt9couiCwmgqE0Lrzq28r51Kex8/sfBmFgIvurFE/DtaY2AC
         cHTcwZIhaSvTfS30bI8NeudaJ7MLk7bQXl+Qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795049560; x=1795654360;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nymuC/5fpi5YK3jj3hRmkBJgLlOLdb1iU6gNf70BLcg=;
        b=ZBu31PRikrKMPiH8do1HQ6rM75JwIOI420tROxBAWowirIOVU7QrIhkIdl43x5TOw9
         HI5kN/XBRy4TDnWBPCcgjr1VUMw2EyeQdehfWhcg18lELhl5fxYkYLgxWVZsx6pqJzXI
         t79gzv8u8jhOJFRyFcQA/rcWIs1Vu7sAzH81k5f+gSe3ikMnC9+Jx80qIJu6G30wUpPe
         S+8JuwfkJSwcW1R6LjnKQLA12i3GYhxMNEoLTYqYl96D/84nCHLSp5lOf5IQsTOcpAZk
         +VY+Ff+kohMaEpUGMfI9Zt75n4qpQXkgBwLF8DQRf3te+bz5+uELYg+inOm2YdmaI1/Y
         2gVw==
X-Forwarded-Encrypted: i=1; AL+hErGB82Ve3tdLT4LdDNI8k3Am0G/2+/8eK19f6L8sVdXGJfuRnIxltlzw9kFP5lOiCOY9lOY8V2696vJiKw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/6DQ1ddLxI+AR6uQfVjtZVlWmvC9iRIJD/O8bcJ80RJfctnxpg
	k+LEIFYQwaQqe697E3krp5kfIrdR03q1s3ZzuHHpcPu3En7F1/QSEXpyMjih1NyO5g==
X-Gm-Gg: AYBFou35zgL+IVQeGUxdx7q/+IQxbAgfwr8WEXZWlKC3GJYk6vhfgxObiuff0A7OFb8
	WqDPdKNPobVfmMNJM4fYyPSzHQq/T0wUeQo230d8KeINiEO6rXROrjKqmxoFsE0leI0387WfyaZ
	7UUnKUIngwDNsSMF7av7RWY2RwKG4uiveoo86zcd+JQxL6s95FE/52tNoj4i9iPCivYLMotUmlt
	efj9qAOtdkFz0WulextT2Vw7eEwSr0GRl7G1zono/qowqT8/khW3WAACGvd2l8fdgo9XeAGPOSp
	J4X3lcykmOwzQezMbHDtWB/sR2SqKXIRs22jwL0fIV3iIYiernPgcLTdfFudHwS51LdQo4kP6yS
	fM2lWoVKr62i5uiPkymyIpb7I/8u60wb2SKKBK+V3bILf4Dwl2KUPJR34hT74Btl59D8WDj7Co+
	CVeUJwoGeq8DtuBvF8Uq/2q/AjaH8xIaarCijapKdwyBkFe19cmGwzZDJWyOeZg2F8kBfh5QB2N
	999zAnL4PbnipA1JOyg/XM7Y3wEjWM4VJTwe/s003E6YIpiX1fGJayK5Tv2VIRtT+h7K03sauvJ
	gVKWACMCzmyq4EyMNdUUshw49UJ62w9X20cICJZXyeDpqiiEbIlMFmZny0vTN8nBF1d5jrO4eHu
	i4SHLpNMMvQQ=
X-Received: by 2002:a05:620a:2586:b0:943:e946:8c6d with SMTP id af79cd13be357-94999667470mr875646085a.72.1795049559815;
        Wed, 18 Nov 2026 16:52:39 -0800 (PST)
Received: from ripwilburliny3.c.googlers.com (128.5.86.34.bc.googleusercontent.com. [34.86.5.128])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b818399sm308860785a.42.2026.11.18.16.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:52:39 -0800 (PST)
From: Steven 'Steve' Kendall <skend@chromium.org>
Date: Thu, 19 Nov 2026 00:52:19 +0000
Subject: [PATCH] PCI: Override Intel Apollo Lake audio class on Gauteng W3S
 laptops [8086:5a98]
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-gauteng-audio-class-set-v1-1-e81d6fd620ad@chromium.org>
X-B4-Tracking: v=1; b=H4sIAEJI/moC/yXMwQrCMAyA4VcZORswVSvzVcRD1mU1Ip00rQhj7
 76qx+/w/wuYZBWDS7dAlreazqmBdh2EO6coqGMzuL3zRNRj5FokReQ66ozhyWZoUtCd/HT2fWA
 6HKHVryyTfn7n6+1vq8NDQvnuYF03yQyccnsAAAA=
X-Change-ID: 20261119-gauteng-audio-class-set-256f769ca134
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 Steven 'Steve' Kendall <skend@chromium.org>
X-Mailer: b4 0.15.2

Gauteng Education Dept MODEL-W3S laptops advertise PCI class 0x040300
to use the legacy HDA driver rather than the Audio DSP on the Intel
Apollo Lake audio controller ([8086:5a98]). However, this board uses an
I2S ES8336 codec with no analog HDA codec, and its firmware otherwise
sets up the hardware to enable the DSP.

Add a PCI header fixup for [8086:5a98] on Gauteng W3S systems to
override class 0x040300 to 0x040100 so the SOF driver can claim the
device. Notably this fixes the internal speakers and headphones but
not jack detection.

This patch and its initial changelog were generated by Gemini during
an interactive debugging session given dmesg, lspci and similar
dumps from Gauteng W3S and MODEL-W3S laptops. The resulting quirk
was reviewed and tested on physical MODEL-W3S hardware and on a W3S
with slightly different hardware.

Signed-off-by: Steven 'Steve' Kendall <skend@chromium.org>
---
 drivers/pci/quirks.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 7f1f47ea2ee4..908d038fa29a 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -754,6 +754,40 @@ DECLARE_PCI_FIXUP_CLASS_HEADER(PCI_VENDOR_ID_SYNOPSYS, PCI_ANY_ID,
 			       PCI_CLASS_SERIAL_USB_XHCI, 0,
 			       quirk_synopsys_haps);
 
+/*
+ * Gauteng Education Dept MODEL-W3S laptops report PCI class 0x040300
+ * (PCI_CLASS_MULTIMEDIA_HD_AUDIO) on the Apollo Lake audio controller
+ * ([8086:5a98]) even though the Audio DSP (BAR 4), NHLT ACPI table, and I2S
+ * ESSX8336 codec are enabled and no analog HDA codec is present.
+ *
+ * Override the class to 0x040100 (PCI_CLASS_MULTIMEDIA_AUDIO << 8) so SOF can
+ * claim the device.
+ */
+static const struct dmi_system_id gauteng_w3s_dmi_table[] = {
+	{
+		.ident = "Gauteng Education Dept W3S",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Gauteng Education Dept"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "W3S"),
+		}
+	},
+	{}
+};
+
+static void quirk_gauteng_w3s_audio_class(struct pci_dev *pdev)
+{
+	u32 class = pdev->class;
+
+	if (dmi_check_system(gauteng_w3s_dmi_table)) {
+		pdev->class = PCI_CLASS_MULTIMEDIA_AUDIO << 8;
+		pci_info(pdev, FW_BUG "PCI class overridden (%#08x -> %#08x) so SOF driver can claim this instead of snd_hda_intel\n",
+			 class, pdev->class);
+	}
+}
+DECLARE_PCI_FIXUP_CLASS_HEADER(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_APL,
+			       PCI_CLASS_MULTIMEDIA_HD_AUDIO << 8, 0,
+			       quirk_gauteng_w3s_audio_class);
+
 /*
  * Let's make the southbridge information explicit instead of having to
  * worry about people probing the ACPI areas, for example.. (Yes, it

---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261119-gauteng-audio-class-set-256f769ca134

Best regards,
--  
Steven 'Steve' Kendall <skend@chromium.org>

