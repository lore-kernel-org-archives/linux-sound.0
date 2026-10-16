Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E19B4CC281
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 13:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158669; cv=none; b=XYsdjk6YErr+VRjmXaGWpQZCyhmctaiJd7B9Gb/o/151zmVBwY7QDUP1Q1IHLh68xbfoO9pSP4OzEk8d7mFsjT8Qyp2qduwf7ZryTYzYvjtwCCUGlfCC02Uc+R1apsIr7Ikjga9XnKt3Ji1C7Jhh31zMC6Ek2CK5NXt1g9A1CX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158669; c=relaxed/simple;
	bh=Cg7Wzu6dZp3KYVFnjaN6WmNCUV7dQ8wSyfbkDpoovas=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FiILLYiCr8ga6nsVe/+gXY4VSsmcqQIcp3fCHAwt+9KJzXMMz40VnTcQZC86JKsb6H5K1TwYXQkKhR9iRYDvJElJkDkWDFQiyOvjlK+mm2jvnzOr65py0jaeMZWLMcvd/lkgoWpvm6iIrWK7Hfw5G7IZrUheedzaWgCx1twYdUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONpnz0ol; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONpnz0ol"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso30426755e9.2
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 06:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792158663; x=1792763463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q1Ejug8D4zQ8KB1tRStJYJdlaIVOQFSEH869zeCaYNA=;
        b=ONpnz0olmW9FJI4tI/btYaN8+/FqVvQoZcuzmaPMBEHraltVvvqtFad5768YlDMR5I
         FIOyssclrYXQJaLKbKxEzWgjk0wTECvCmV4P2f78O4PJtguoN1hwEzdfVuLIh11Qtg7U
         4U7Z16pAEr26Gi5lERpj+O7yMSdaxyf9tHMaV3n77rQ6anBBYAXFwINxnftkuATNEXbG
         aFocyyaB4Oc5igUQxJmaP0fMIY/ze1QQLbk20yzGmi9GI45+SXq9+FiXAU4RtzM0lAmy
         8L4Y+lfUyv6SCqSRWOs+fz62Me09JenpwYAbvzbKfRF8GZxm16WOpXbv5jgpqgiFLzyH
         IBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158663; x=1792763463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1Ejug8D4zQ8KB1tRStJYJdlaIVOQFSEH869zeCaYNA=;
        b=i9tVLRdG+t5CduSluWWV0Isk1EfmuMaGEyN9VbRxhDkcZDm6bU5WbQpbHXGURJIrDx
         0Ensjfj4UIuLDvYifYZfDtPmZAfoqPvogImCbNlaL3MCb/eV3KIIdkkOUnBKY/VQspQK
         ORoPrRAvAYd33DDWFwXFS9PMTOotQJyH9ldRoeWb9ZHOmkrOhvN9CjizirYhrk2axXFn
         6p5qS9BSeSmmzIyffkGMtHYwsD56NgRNyjOqMm6ShIVQi91prNACBPFEv/rWw4EvKS7S
         U82Tj5qfWd/71u8pq6XqvTzfIh8ECw9uR45RMrS5dqY7/zCw9hQmv/3vJjEEPbd8w4F0
         hJXA==
X-Forwarded-Encrypted: i=1; AKwUvBzUhnXV0bGeAiQtmMQSZ/Bdwrg6LGSMEaWCI7sBOgtQp6TXpwZSHHo7dduOgMbojpBqItH+lCW13sbWYA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLs6qeJCqik4llgEqqjWoBjV+hecDy91Nk7gihJ2qKyjLNzOq9c
	we7Tp7qXz2TKcOptjWydqmHEmYng491COJkcZllhyXWS0/RfE7N5ahzO
X-Gm-Gg: AYBFou1RfyGWZcjOKv19KidRwr/g9wZjuBH/rxCd3fSwSAZ8b8DIJ2zfLfMfdY9HIje
	c8JaGKkIsX462+JSowIQgzg1KFYmxr9ogmAqYK3qbUsnZxCP5/nCqm3lP7U7JVPgUZwh1ZnhBgO
	QyjXKMcwGhHzW1BMRTiakVlDU0T6kNUiRpZfS2yolpwfkWLI8dZFq07pBAhhDvzO4S/m1gBAQlx
	9/NAA8nVgeXR43f7wpf+RG4FRZ8tZxh+u4xrMHLvQ28BVwbdPr7pPD2Cmuyk7NSX8JH2BHuuacm
	l05v1b3lQwiboEFK89zLgs/lBz5AYwi89CaSdaqwhfwiGXl+uxV3E/UferUtwd7/PGxdGm4N9Gh
	PPuiEZexztJXD8JYNsm6Q7H4si3DlGpm0q0OVyYQ8RCd5BhwvUkDCEojOCWX6DFl+IrafR97i97
	LMI0AsfbGSxohjivCd+rm5CmfnJ5RHcnr6tl6i7LTfhH4zbFzU1XNSMtEapQnsqjHNDdFm3KZuY
	z2llCMujo4NTs6G4fD+axY=
X-Received: by 2002:a05:600d:82e4:b0:4a1:a49e:a925 with SMTP id 5b1f17b1804b1-4a1a49ea94bmr310744565e9.35.1792158662480;
        Fri, 16 Oct 2026 06:51:02 -0700 (PDT)
Received: from localhost.localdomain ([2001:818:dc1d:c500:21cd:8ec9:48da:59ee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d2e93a01sm27190725e9.0.2026.10.16.06.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:51:01 -0700 (PDT)
From: Diogo Sousa <diogogsousa@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org
Cc: Diogo Sousa <diogogsousa@gmail.com>,
	Mario Limonciello <superm1@kernel.org>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	David Glushkov <david.glushkov@sntiq.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PCI: Disable async suspend for AMD rev 0x62 ACP and HD Audio
Date: Fri, 16 Oct 2026 14:50:35 +0100
Message-ID: <20261016135042.44914-1-diogogsousa@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On AMD platforms with a revision 0x62 ACP, such as Dragon Range and Fire
Range laptops, the HD Audio controller usually stops responding after
resume from suspend:

  snd_hda_intel 0000:69:00.6: CORB reset timeout#2, CORBRP = 65535

Audio playback then stalls.

The ACP (function 5) and the HD Audio controller (function 6) share an
audio block whose power is gated by the firmware.  In the AMD CPMACPV4
SSDT, the _PS0 method of each function marks the function as present
and then calls a common method that powers the block up only if exactly
one function is present:

  Method (_PS0, 0, NotSerialized)  // ACP; AZAL sets M279 instead
  {
      M278 = One
      M276 ()
  }

  Method (M276, 0, Serialized)
  {
      Acquire (M27E, 0xFFFF)
      If (!(M278 ^ M279))
      {
          Release (M27E)
          Return (Zero)
      }

      // Power up the audio block.
      ...
  }

The presence flags are set outside the lock, and M276 calls a debug
print method before the check, during which the AML interpreter can run
other threads.  So when the PM core resumes both functions in parallel,
both flags can be set before either _PS0 reaches the check.  Both _PS0
methods then skip the power up, each assuming that the other function
did it.  An ACPICA trace of a failing resume shows exactly that: the
M276 call of the ACP sees both flags set and returns early.

Disable async suspend for both functions, so that the PM core never
suspends or resumes them at the same time.

This started with v7.1, which moved these ACPs from the RPL driver to
the YC driver.  With the ACP bound to the RPL driver, test resumes
worked, but it isn't clear why the YC driver makes the race so much
more likely.

Fixes: df4148a5a3cf ("ASoC: Add DMIC support for the AMD RPL platform")
Link: https://github.com/CachyOS/linux-cachyos/issues/950
Assisted-by: LLM
Signed-off-by: Diogo Sousa <diogogsousa@gmail.com>
---
Tested on an ASUS ROG Strix G16 G614FR (Ryzen 9 9955HX3D, BIOS G614FR.317):
without this patch (v7.2.9), every resume from s2idle broke audio; with it,
on top of v7.3-rc7, three resumes in a row worked.

This also covers the MSI Raider A18 HX A9WJG, for which a quirk matching its
subsystem ID was posted:
https://lore.kernel.org/r/20260606204547.11945-1-david.glushkov@sntiq.com

 drivers/pci/quirks.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index de9bbccda21f..d4e4ab3c332e 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -1901,12 +1901,44 @@ static void quirk_jmicron_async_suspend(struct pci_dev *dev)
 }
 DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_JMICRON, PCI_ANY_ID, PCI_CLASS_STORAGE_IDE, 8, quirk_jmicron_async_suspend);
 DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_JMICRON, PCI_ANY_ID, PCI_CLASS_STORAGE_SATA_AHCI, 0, quirk_jmicron_async_suspend);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_JMICRON, 0x2362, quirk_jmicron_async_suspend);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_JMICRON, 0x236f, quirk_jmicron_async_suspend);
 
+/*
+ * On AMD platforms with the revision 0x62 ACP (e.g. Dragon Range and Fire
+ * Range), the firmware power gates the ACP (function 5) and HD Audio
+ * (function 6) together.  The _PS0 method of each function marks it as
+ * present and then powers up the shared audio hardware only if the other
+ * function isn't present yet.  The marking isn't done under the lock that
+ * serializes the power up, so if both _PS0 methods run concurrently, they can
+ * both conclude that the hardware is already powered up.  The HD Audio
+ * controller is then left unpowered, with all its registers reading ~0.
+ *
+ * Suspend and resume both functions synchronously, so that the PM core never
+ * transitions them at the same time.
+ */
+static void quirk_amd_acp_hda_async_suspend(struct pci_dev *pdev)
+{
+	struct pci_dev *acp;
+
+	acp = pci_get_slot(pdev->bus, PCI_DEVFN(PCI_SLOT(pdev->devfn), 5));
+	if (!acp)
+		return;
+
+	if (acp->vendor == PCI_VENDOR_ID_AMD && acp->device == 0x15e2 &&
+	    acp->revision == 0x62) {
+		device_disable_async_suspend(&pdev->dev);
+		pci_info(pdev, "async suspend disabled to avoid ACP/HD Audio power up race\n");
+	}
+
+	pci_dev_put(acp);
+}
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_AMD, 0x15e2, quirk_amd_acp_hda_async_suspend);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_AMD, 0x15e3, quirk_amd_acp_hda_async_suspend);
+
 #ifdef CONFIG_X86_IO_APIC
 static void quirk_alder_ioapic(struct pci_dev *pdev)
 {
 	int i;
 
 	if ((pdev->class >> 8) != 0xff00)

base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
-- 
2.56.0

