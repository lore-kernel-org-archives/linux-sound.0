Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793571508;
	b=WgcbRlszi6QaC8KDj9SArCwIXMZpskrPKDCO8UaGJuvu0bTE9J5whcWzMW+/nnbttde/
	 N5ugEwkObx/TEwJpyi04CYb79oi3JcP7riEivOED2E4LgHsTsGX+FgZmFXeduqeEABJEh
	 bbhI8P3iAdI5AXHGgIJdBgvdgfSjr6AMN7BbUbaYyld4p/BmSVMsGwvTV9R2EreEQgRsT
	 UqEHGWBB/iVA1RI2rMHIjJ+SqS6Q3YxX08t1VNTduD/aaFmz4mfuCxBuiKjisTgKqZfce
	 /wDSsbJMbhwFUb6vpAVYvQUgO+uFfAm89sQVfrN1XSiCc/6jT82yCfcuQJRKPa4yR2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=zd20Kr2jG+wpBIUO+vpZmn6D+HgadQK1zsiLf1TK1sw=;
	b=0f1h8S1P27Pi8CFRjykVRzpLNgy+0sh2Mbz4MJ8W7RH3qGwZW9xgcDoXMOoTSdzTovf2
	 IIUzCZSrV8ISyvls0KrRGVwGYVqn7st/pZXjoJakhciVxBVSueOTzxg4tENFFCDe5Cs9+
	 y/xOvxpJIggA9m+entLaIHN73R0gbonAGMN+c4/4ptLIEJwxZOR1IRkD9BLjEYPeE77Qy
	 iOSxSQJQxn/ixEnOjMY7m+La6po3R2TxCeVyDaaiGNd2BDlgPvbljU1hRffUo4Jbpljif
	 Je93UsTfz1mbFycVFbsSEewQCUFiSy0k8W7rzVjqpLjCx+YNOctFK1Po10/se8vY45Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fSrFqsKz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7EF606A32C
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 22:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA7EF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fSrFqsKz
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so3343885a12.3
        for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 14:18:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793571506; cv=none;
        d=google.com; s=arc-20260327;
        b=KCjh4eBm7RK6WRpE0xMT0ioSFDjRJZFfH2SVXa0Q49fTXK9QFxbcOLIf8IOrSVHLF+
         iu18frQ8ZLIu0t95VNKauJcz+hshQhd86K1A/JD8dMLSdsuvebgfEIlGmpKOLAUxPHdk
         oxpkdRNSHW7GsM5vFu41ghu4SValcGwE8UleHPJMswfAXEfp+2TbbzSNLARLfcp6kVBk
         LqkgYClWmVB8IVdhBGio18+RDm2+noOGFVbdHaBAJuhZwzWKyiKqnNpvzfDV9ZJlNrWn
         VelDcB6JVCFhKXQ8rJlprICa+OjyuqqJAjQDrYQyRFCGu9u2m+3TdwRseEWzFjg9QzbB
         ZBIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:mime-version:dkim-signature;
        bh=zd20Kr2jG+wpBIUO+vpZmn6D+HgadQK1zsiLf1TK1sw=;
        fh=xbqdtx+WEP9hUpf99aY8Ut0ZvKY/nvwLLXqsfE5yL+M=;
        b=bAvbe8qC2vyYl1FBf2Ctcc76pvliGgDIwep5bXJ1qCNfRXhqZ+4ZHsR6z9YnPM7j5q
         rbYmqUxJ1vbWK/RQ8aKIMkxroXUgLBfzZKPiUfvH0KjwM+7i8+WXpC0mbHOsCEnA+HqA
         GJFxO8Rc+LREnH+FP6Btki0XZBonMBtfhQimh96hpJMA7wxsBLhOJmF7vMDLS+WbFMya
         Q3KBV4fuAXBWHjwGN7BJnZwfnMR4gbT5H8x+w9FaBxx1f6Tk+W/HRu9G+wKfLIBTSOUV
         Ag9w64RokjD+1TVZ/lcdLofKhSAjQrMe17hV2NkIFCUhev9ARtR9HVWNTVW2hYw0ccDE
         fx6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793571506; x=1794176306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zd20Kr2jG+wpBIUO+vpZmn6D+HgadQK1zsiLf1TK1sw=;
        b=fSrFqsKzpDLjiUDXBr+/tqqXCn3/IZ0KtRDNSZnbZwic5GYqgD50nfhxzH9Jn+cMDH
         PBJjOi74lDvjR2XvNXaxvmb/3Ui3i3YZucBUP9j1xFZTmLLP6QWiOMXGZOhzeyjZ6eIX
         C19pgaVL4VBxsOW4dMWViVxtLpRk/1YtCReQGmEE+AkpgBgwb+P7rXrQ2vDULO3nwiZh
         Gut9DjGCPH3U8CHkt5Yio/m+qO7ZRubOkpMHpm92LegMJlE7GFrJYXZfNlZ5jcZJSI5G
         3uPGW53AJGykdKmbuU/BQgqrdKvI3tCeDkKL46f5pJMPnPnpaF/GsX1jIon77qLd8cxl
         rshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571506; x=1794176306;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zd20Kr2jG+wpBIUO+vpZmn6D+HgadQK1zsiLf1TK1sw=;
        b=KKN0ZW8YMG+Yxaqk11xBjmRyqqfiK/GmdJDI0lzVXhJHNlsgxaR3Vt5XV06M4Qt864
         /oK95UUMG6qBGmWEi63eQtUJZkbIRNF9OI22m1QvfP1P2g6FP+sF9qUmJykNAdlQDW2q
         vTSjMz4ec65CAKVE2gGY5fwAGz9FjDBXe1P3cQzlK1poCcuaFINkh/k8NtiTi57axjnf
         muYZIVySopF3anYudzBoVqGNxSIOcgws2OoGdp9vNMJJKs7sVYmc135oq+ZaWuHAK2uB
         zeSIvjMuyvhIREITApF83/z7e4Ld2HzP7QLucXE2jmJBIUFbCtFdPzmI2JO+/IziIX7Q
         XNXw==
X-Gm-Message-State: APuU4Z8k9my2RO6cNRaVTNUJ+q7rEpTx0RJpe1KXLQ7MQfvX7VuwlDHS
	Z9AYn+eg2ZVtoDfEhos5Hs1QoQDtXBPe4w73FtVIf4F31rEaPxpOYKYVsX6tz8+yNVYLkkTTz2y
	NlHqD6tAmI0SG0l9DBh4CY8DkO05jaOA=
X-Gm-Gg: AYBFou15CQcjJMjhFLnQpGh+vHTNeIGpsFKRFv+485KqZIod+4Q/LlkBnU4qbf6cfZF
	ryPnt61xDUrPvK0koI6WTY5PdbACkyGyPpzUSNYkc3VJxCCmCbOYjBcG6QfGPdaB/Hp+uEOCVZG
	eAsrYFVBO9HFFHtHjecc1yF7Q486752IQQaJBuQtsQmtJPIZsL8Hg/4s/bFUFCs1twhJM1DYls8
	N5k4yv+5NqjjuNP96fEumeAkfYvAE1jhq0pRotlmBpzVXYKEEKnr/RncB4j02NMnN7/K0XHzJCW
	JXeQg63mHzRKxvSueKuBVCSbWWdhmXMYDLHlAM4JbzEkgIjTyQ39UsnSlgrKLrLFT2sjXt4fmdk
	ad8CbyOMSptJZFsLIsI7icBBvfTgtxeoczHwOF/S7542L/lnTzsmT0xUE82E=
X-Received: by 2002:aa7:c24c:0:b0:6b4:5a0c:a7fc with SMTP id
 4fb4d7f45d1cf-6b4d4d738ffmr4199376a12.26.1793571505882; Sun, 01 Nov 2026
 14:18:25 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Reply-To: yo@miguelrevilla.com
From: =?UTF-8?Q?Miguel_Revilla_Rodr=C3=ADguez?= <migrev@gmail.com>
Date: Sun, 1 Nov 2026 23:18:13 +0100
X-Gm-Features: AclHuK-c09-4rAv-gYdZmBcBJqHP3BI3ufjPXwPmJjbaWNLmFjNpCpjVHq1C_pM
Message-ID: <CAG9fDsV01JJx6=xbts1XJ3+utG5yzys5BqJ5UcHWp6-_wDKpxA@mail.gmail.com>
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for HP OmniBook 3 16-by0xxx
To: broonie@kernel.org, Vijendar.Mukunda@amd.com
Cc: linux-sound@vger.kernel.org, venkataprasad.potturu@amd.com, 
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The HP OmniBook 3 Laptop 16-by0xxx with board name 8EE3 does not
expose its internal microphone with the current ACP6x machine driver.
The ACP device is handled by snd_pci_acp6x, but the machine device
remains unbound and no ACP capture card is registered.

Add the HP 8EE3 board to yc_acp_quirk_table so that the driver can
select acp6x_card and register the DMIC capture card on this machine.

Assisted-by: LLM
Signed-off-by: Miguel Revilla Rodr=C3=ADguez <migrev@gmail.com>
---
Based on the ASoC for-next branch at
11ae63bd9030349a0136fb2edd1622a4a029edc8.

Hardware inspected on the affected laptop:
- DMI product: HP OmniBook 3 Laptop 16-by0xxx
- DMI board vendor/name: HP / 8EE3
- PCI ACP device: 1022:15e2, revision 60, subsystem 103c:8ee3
- PCI driver: snd_pci_acp6x
- Kernel: 7.2.11-arch1-1
- acp_yc_mach.0 exists but is unbound; no ACP card in /proc/asound/cards.

Validation: git diff --check and scripts/checkpatch.pl --strict.
The patched driver has not been built or loaded, and microphone capture
has not been tested with this change. Running-kernel headers are absent.

AI assistance: Codex helped inspect the hardware identifiers, prepare the
DMI table entry and changelog, and identify the submission recipients.

The same quirk was previously proposed as a GitHub PR:
https://github.com/tiwai/sound/pull/8
This is its first submission to the mailing list.

 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index ae2652445..f7a1b8b8f 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -766,6 +766,13 @@ static const struct dmi_system_id yc_acp_quirk_table[]=
 =3D {
  DMI_MATCH(DMI_BOARD_NAME, "8DC2"),
  }
  },
+ {
+ .driver_data =3D &acp6x_card,
+ .matches =3D {
+ DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+ DMI_MATCH(DMI_BOARD_NAME, "8EE3"),
+ }
+ },
  {
  .driver_data =3D &acp6x_card,
  .matches =3D {

base-commit: 11ae63bd9030349a0136fb2edd1622a4a029edc8
--
2.56.0
