Received: from mail-oo2-f7.google.com (mail-oo2-f7.google.com [74.125.231.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1698238A702
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 20:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789503573; cv=pass; b=UEjvj7P1LLeQFYP54fhCOWEGKg2NQ2wDJo9K6lyOa4cqak2MFjiBDc3RhYJHP11ysdciT7tkfvwy6llXoUTxEPM/UUMXa6b2sfTsPaVsE3JhZKRsYP4hrIVuDNU6sfSZw42ZzH17RY3y8MCANIStHkzzbkNHBv3t0hdiCnIEAm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789503573; c=relaxed/simple;
	bh=juUs97q5Qw8ubPd/a19+qZuR++lQAGVYLSFxpWrgPp0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kuDmI9WypqhPqjOmF3g05ypEvgeFVgje7JRmqRwmhURMOJnBjWEgMQJh4WBJQf2BL3DOVd2Fu0d9GaSV694KEI0mzEAGYQUgzIb0QKLvBHTi5FQejFvU9bTk7Kp1yXE+woV7fMR2dlVkU1y1R5gDP+KKJIhipLr4lYrRsHZg81U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sAt/WogD; arc=pass smtp.client-ip=74.125.231.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sAt/WogD"
Received: by mail-oo2-f7.google.com with SMTP id 006d021491bc7-6c197ff1f3aso1210527eaf.0
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 13:19:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789503568; cv=none;
        d=google.com; s=arc-20260327;
        b=MZAPNrtmeV4LxX93NkzG/YtUCKNzJxycLzy4rHB5J4JsfvVMiVsxSXdWpJzerDvgpL
         A/9pv39MFlARRnc2ZNigudWOCCUApnq2gJm/DTXnsLj+DsH9dmZXC5K+ffAfZQTzjlEY
         6A2WPlbNsS9IYY75vNF94hjM8/UBK1PUKaQyXQZ4+uZ3jxUOSA4aC0PF/fJF/yY6t4AH
         YR4tLXHGFJJURoo2n+6JpQf9/z1WTz/CBEiqWip/gNfcFibV/XIYpEybTPoHscbYi8U7
         /o3DgO7MJ8lFroEy8+4T1LoUCkdW2jXGBxvhUsxI8zRM8YCeM25AnkNFE6EABz+mOT2Q
         1IhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=n0STPoo8JK+NrxFX/3l2oSISgPdQznOlcw+mBM7Ja7o=;
        fh=+S92PG7yuoz4UwlJDIjyG64QQOdLgS2ul2EzItcwq2U=;
        b=CC88WGEGbL3SCqq9mOpXGN4G1C0vMDVKH0xEwF7/S1ULxRjuzsWow2t/i6zcyRLMW1
         rtLMrqjMMNaC51FYCoq7Zn9ohxOFPrEswWu6lDZg2rfK7Zreel8fLWsHCoM/RHWV0R8b
         RaQoWFL7PDQNcUxIjv+tdYbdTU3EDuqjsmynG/JojYgEhdruhSq/6YM60W9eGfjCX4N9
         5hRNQlFGZdQLjSBoH2InunUYX8iFbK04X2hcTJ2aJ0lCBEtBPhT5jhWeprGSRwvEBpsU
         ZrrtWXZOspIfdJtOiJ3dn2VMlcmgVH6glM4HqO+ntqoh6ifYs7ooCT1Ku7lCSJ7+dNHE
         4y0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789503568; x=1790108368; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n0STPoo8JK+NrxFX/3l2oSISgPdQznOlcw+mBM7Ja7o=;
        b=sAt/WogDb00Blj8rG8JPcRSb2XhgcciSm+gquUR0POcDhlq89kdGx5xBh8taBvkghV
         kYS50PVKuUkh7blzjxJ+c9FC7VVx6ngru81dOUGf84u1eRHUmU4DostHzxNJMdMbH38d
         kCCPjePFGr0DKvkPfS8LGq09MqbBYEttXbXoOpwWIrN9AUyVREU7X1H+AXjvvQbYcpiT
         RF0hUO0zFmi9W5oFpazk2RkPldYW60TduZt6aMgEM4ODDgDhLsSHBwF2+2N+NflZrGuG
         7670aBcIIUAtyZO87MWn/ul4+in+S0N9yi5DrSTbnKsvSXA+CfPmvkHGmUwGbv/AGdYr
         W0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789503568; x=1790108368;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n0STPoo8JK+NrxFX/3l2oSISgPdQznOlcw+mBM7Ja7o=;
        b=zYPguJJV3QQNXMRsdglcn/bcDAK0QrJ4r0ja7a5ijqdHXKVOqwtMgwgFQANlDTydK6
         6xwBfLlp5bRAxbW4HgzChBAgzDKp9BBUWCb3Iysvp5U0+UNxKjxvl6tcMlgkmECE5dVY
         /WB6ffGjchrd7jfHUOkwmeB3X3R3EiwPYR7yxU3Og7sZhGBxPVDDvAJXumMDeaHnSc1r
         ZSx+PjeCN0vW1JsoIibj5ptz2x8dJS66OOPMNxEFHzFaWWFeVKsI3ZpeJhpDWlqH0vEj
         ni35zCyP+IPOvXadCYLAk2vm5IDkX84W6RWSas2eK2myvxd0oRMztpRBVZKHUCkjUI1F
         BuQA==
X-Forwarded-Encrypted: i=1; AKwUvBxLtoUCAGe4r0y/xUvaFnognfuHK+wnGOZ+9QDY3ZA3NvvvlPoRxYyUGCCP+L/XODrkW+vfEqQGW0lrMg==@vger.kernel.org
X-Gm-Message-State: AFuF++lSQGLgZEjHC9udSezEbLtF2wsEFJZUqRJZHSgwtMAWX+GbCQL5
	w8RglJdV/HfDpy8R0A+1zDvyUzBsgt9e0cilffctsw/PYWdLltAzm0lnLFv+YTDlNH+fQ4UrkC7
	n6J2q3J6nB5a/PYiiH0EbyawyyjFidQc=
X-Gm-Gg: AYBFou3zqQhWN/zwMFFChPOYtrFo+ThG/juo4WAZUoJBFlqNv9c5278gPtr7nD6Xj2v
	Z/ggxFrKjCw2j0eTzIOsyL8Zf/0P1MHyr2sVpUtOnxDXJ+UMDoj+lIne9YMoW1AydTSdaXRsC6p
	zMIr93TprAIhA5SE728KQgqdlroKO36YPlgJrCZUCEtQG9xbaDL750paelmKZAE5w4geWxa24eT
	yY4Gq8KBWfGA96h9OtL7YOMemdhrfSezmdVACq9F/HzuRmebdA63OQyJzDOajSAeOY8nlZhvL6b
	i9CwylsIez0gwKv96t6sr360NnTQKkNvb2+zlemWuxgifC9D3cGb5znoVmBejpK09WAjr3Uzy9s
	FxRrID9o=
X-Received: by 2002:a05:6820:220a:b0:6be:1570:73b6 with SMTP id
 006d021491bc7-6c7d35fb2b3mr163077eaf.20.1789503567998; Tue, 15 Sep 2026
 13:19:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Siarhei Tsakhanovich <siarhei.tsakhanovich@gmail.com>
Date: Tue, 15 Sep 2026 23:19:17 +0300
X-Gm-Features: AcwNN1XT_eUhUISDWsEuXPU0DgBjfN0W2YwfOVslUmzTaXyw2gYY6QPp27ZLjqI
Message-ID: <CANcLFTb0g7jBoW66+2J00BfWvrL9JOZ+dgw84Gh2uve+ZfQTbg@mail.gmail.com>
Subject: [PATCH] ASoC: amd: acp: add ACP70 SoundWire quirk for standalone rt721-sdca
To: Vijendar.Mukunda@amd.com
Cc: enkataprasad.potturu@amd.com, linux-sound@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000007f044e065b8b4479"

--0000000000007f044e065b8b4479
Content-Type: multipart/alternative; boundary="0000000000007f044d065b8b4477"

--0000000000007f044d065b8b4477
Content-Type: text/plain; charset="UTF-8"



--0000000000007f044d065b8b4477
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><br></div>

--0000000000007f044d065b8b4477--
--0000000000007f044e065b8b4479
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-ASoC-amd-acp-add-ACP70-SoundWire-quirk-for-standalo.patch"
Content-Disposition: attachment; 
	filename="0001-ASoC-amd-acp-add-ACP70-SoundWire-quirk-for-standalo.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mu347fft0>
X-Attachment-Id: f_mu347fft0

RnJvbSA5OTc3ODZlZTVmNzkwZmQ5YTY1NWEzMzU3NGQzMzE4ZmQ5ZWYxMWU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaWFyaGVpIFRzYWtoYW5vdmljaCA8c2lhcmhlaS50c2FraGFu
b3ZpY2hAZ21haWwuY29tPgpEYXRlOiBNb24sIDI0IEF1ZyAyMDI2IDE2OjUxOjA3ICswMzAwClN1
YmplY3Q6IFtQQVRDSF0gQVNvQzogYW1kOiBhY3A6IGFkZCBBQ1A3MCBTb3VuZFdpcmUgcXVpcmsg
Zm9yIHN0YW5kYWxvbmUKIHJ0NzIxLXNkY2EKClRoZSBBU1VTIFZpdm9ib29rIDE4IE0xODA3R0Eg
KEFNRCBSeXplbiBBSSwgQUNQIDcuMCkgZXhwb3NlcyBhIHNpbmdsZQpSZWFsdGVrIFJUNzIxLVNE
Q0EgY29kZWMgb24gU291bmRXaXJlIGxpbmsgMSwgcHJvdmlkaW5nIGphY2sKZGV0ZWN0aW9uIChV
QUopLCBhbiBpbnRlZ3JhdGVkIHNwZWFrZXIgYW1wbGlmaWVyIChTbWFydEFtcCkgYW5kCm1pY3Jv
cGhvbmUgY2FwdHVyZSAoU21hcnRNaWMpIGFsbCBmcm9tIHRoZSBzYW1lIGRldmljZSwgd2l0aCBu
bwpzZXBhcmF0ZSBleHRlcm5hbCBhbXBsaWZpZXIgY2hpcC4KCnNuZF9zb2NfYWNwaV9hbWRfYWNw
NzBfc2R3X21hY2hpbmVzW10gaGFzIG5vIC5hZHIgZW50cnkgd2hvc2UKdmVuZG9yL3BhcnQgSUQg
bWF0Y2hlcyB0aGlzIGRldmljZSwgc28KYWNwNjNfc2R3X21hY2hpbmVfc2VsZWN0KCkgKHNvdW5k
L3NvYy9hbWQvcHMvcGNpLXBzLmMpIG5ldmVyIGZpbmRzIGEKbWF0Y2hpbmcgcHJvZmlsZSwgdGhl
ICJhbWRfc2R3IiBwbGF0Zm9ybSBkZXZpY2UgaXMgbmV2ZXIgcmVnaXN0ZXJlZCwKYW5kIG5vIEFT
b0Mgc291bmQgY2FyZCBpcyBjcmVhdGVkIC0tIGV2ZW4gdGhvdWdoIHRoZSBydDcyMS1zZGNhCnBl
cmlwaGVyYWwgZHJpdmVyIGNvcnJlY3RseSBiaW5kcyB0byB0aGUgY29kZWMgb24gdGhlIFNvdW5k
V2lyZSBidXMsCmFuZCB0aGUgY29kZWMgaXMgYWxyZWFkeSBmdWxseSBzdXBwb3J0ZWQgZ2VuZXJp
Y2FsbHkgKHBhcnRfaWQgMHg3MjEKaW4gc291bmQvc29jL3Nkd191dGlscy9zb2Nfc2R3X3V0aWxz
LmMsIHBsdXMgdGhlICJydDcyMSIgREFQTSByb3V0ZXMKYWxyZWFkeSBwcmVzZW50IGluIHNvY19z
ZHdfcnRfbWZfc2RjYS5jIGFuZApzb2Nfc2R3X3J0X3NkY2FfamFja19jb21tb24uYykuIE9ubHkg
dGhlIEFDUEkvU291bmRXaXJlIG1hdGNoLXRhYmxlCmVudHJ5IGlzIG1pc3NpbmcuCgpBZGQgdGhh
dCBlbnRyeS4gVGhlIC5hZHIgdmFsdWUgaXMgYnVpbHQgZnJvbSB0aGUgdmVuZG9yL3BhcnQvdmVy
c2lvbgpyZXBvcnRlZCBieSB0aGUgZGV2aWNlIGl0c2VsZiAobW9kYWxpYXMgc2R3Om0wMjVEcDA3
MjF2MDNjMDEpIHdpdGgKdW5pcXVlX2lkIDAsIG9uIGxpbmsgMSAoYXMgcmVwb3J0ZWQgYnkgdGhl
IFNvdW5kV2lyZSBzbGF2ZSBkZXZpY2UKbmFtZSBzZHc6MDoxOjAyNWQ6MDcyMTowMSwgd2hlcmUg
dGhlIHNlY29uZCBmaWVsZCBpcyBidXMtPmxpbmtfaWQgLS0Kc2VlIGRldl9zZXRfbmFtZSgpIGlu
IGRyaXZlcnMvc291bmR3aXJlL3NsYXZlLmMpLiBUaGUgdGhyZWUKZW5kcG9pbnRzIChqYWNrLCBh
bXAsIG1pYykgbWlycm9yIHRoZSBsYXlvdXQgYWxyZWFkeSB1c2VkIGZvciBydDcyMiwKd2hpY2gg
aGFzIHRoZSBzYW1lIDMtREFJIG11bHRpLWZ1bmN0aW9uIFNEQ0EgZGVzaWduLgoKVGhpcyBjb3Zl
cnMgdGhlIHNwZWNpZmljIGJvYXJkIGxheW91dCBvYnNlcnZlZCBvbiB0aGUgTTE4MDdHQQooc2lu
Z2xlIHJ0NzIxLXNkY2Egb24gbGluayAxLCBubyBleHRlcm5hbCBhbXBsaWZpZXIpOyBib2FyZHMg
cGFpcmluZwpydDcyMS1zZGNhIHdpdGggYSBzZXBhcmF0ZSBhbXBsaWZpZXIgYWxyZWFkeSBoYXZl
IHRoZWlyIG93biBxdWlyawooYWNwNzBfcnQ3MjFfbDF1MF90YXMyNzgzeDJfbDF1OGIpLgoKVGVz
dGVkIG9uIGFuIEFTVVMgVml2b2Jvb2sgMTggTTE4MDdHQSAoQU1EIFJ5emVuIEFJIDcgNDQ1LCBB
Q1AgNy4wKToKdGhlICJhbWQtc291bmR3aXJlIiBjYXJkIG5vdyByZWdpc3RlcnMgd2l0aCBTcGVh
a2VyLCBIZWFkcGhvbmVzLApTb3VuZFdpcmUgbWljcm9waG9uZXMgYW5kIEhlYWRzZXQgTWljcm9w
aG9uZSwgYW5kIGF1ZGlvIHBsYXliYWNrCndvcmtzIGNvcnJlY3RseS4KClNpZ25lZC1vZmYtYnk6
IFNpYXJoZWkgVHNha2hhbm92aWNoIDxzaWFyaGVpLnRzYWtoYW5vdmljaEBnbWFpbC5jb20+Ci0t
LQogc291bmQvc29jL2FtZC9hY3AvYW1kLWFjcDcwLWFjcGktbWF0Y2guYyB8IDQ0ICsrKysrKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9zb3VuZC9zb2MvYW1kL2FjcC9hbWQtYWNwNzAtYWNwaS1tYXRjaC5jIGIvc291bmQv
c29jL2FtZC9hY3AvYW1kLWFjcDcwLWFjcGktbWF0Y2guYwppbmRleCAxYWU0M2RmLi40YmUyZTJm
IDEwMDY0NAotLS0gYS9zb3VuZC9zb2MvYW1kL2FjcC9hbWQtYWNwNzAtYWNwaS1tYXRjaC5jCisr
KyBiL3NvdW5kL3NvYy9hbWQvYWNwL2FtZC1hY3A3MC1hY3BpLW1hdGNoLmMKQEAgLTE0Myw2ICsx
NDMsMzYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2FjcGlfbGlua19hZHIgYWNwNzBf
NF9pbl8xX3NkY2FbXSA9IHsKIAl7fQogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29j
X2FjcGlfZW5kcG9pbnQgcnQ3MjFfZW5kcG9pbnRzW10gPSB7CisJeworCQkubnVtID0gMCwKKwkJ
LmFnZ3JlZ2F0ZWQgPSAwLAorCQkuZ3JvdXBfcG9zaXRpb24gPSAwLAorCQkuZ3JvdXBfaWQgPSAw
LAorCX0sCisJeworCQkubnVtID0gMSwKKwkJLmFnZ3JlZ2F0ZWQgPSAwLAorCQkuZ3JvdXBfcG9z
aXRpb24gPSAwLAorCQkuZ3JvdXBfaWQgPSAwLAorCX0sCisJeworCQkubnVtID0gMiwKKwkJLmFn
Z3JlZ2F0ZWQgPSAwLAorCQkuZ3JvdXBfcG9zaXRpb24gPSAwLAorCQkuZ3JvdXBfaWQgPSAwLAor
CX0sCit9OworCitzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfYWNwaV9hZHJfZGV2aWNlIHJ0
NzIxXzFfc2luZ2xlX2FkcltdID0geworCXsKKwkJLmFkciA9IDB4MDAwMTMwMDI1ZDA3MjEwMXVs
bCwKKwkJLm51bV9lbmRwb2ludHMgPSBBUlJBWV9TSVpFKHJ0NzIxX2VuZHBvaW50cyksCisJCS5l
bmRwb2ludHMgPSBydDcyMV9lbmRwb2ludHMsCisJCS5uYW1lX3ByZWZpeCA9ICJydDcyMSIKKwl9
Cit9OworCiBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfYWNwaV9lbmRwb2ludCBydDcyMl9l
bmRwb2ludHNbXSA9IHsKIAl7CiAJCS5udW0gPSAwLApAQCAtNTMwLDYgKzU2MCwxNSBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfYWNwaV9saW5rX2FkciBhY3A3MF9hbGM3MTJfdmJfbDFb
XSA9IHsKIAl7fQogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2FjcGlfbGlua19h
ZHIgYWNwNzBfcnQ3MjFfb25seVtdID0geworCXsKKwkJLm1hc2sgPSBCSVQoMSksCisJCS5udW1f
YWRyID0gQVJSQVlfU0laRShydDcyMV8xX3NpbmdsZV9hZHIpLAorCQkuYWRyX2QgPSBydDcyMV8x
X3NpbmdsZV9hZHIsCisJfSwKKwl7fQorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29j
X2FjcGlfbGlua19hZHIgYWNwNzBfcnQ3MjJfb25seVtdID0gewogCXsKIAkJLm1hc2sgPSBCSVQo
MCksCkBAIC02NzUsNiArNzE0LDExIEBAIHN0cnVjdCBzbmRfc29jX2FjcGlfbWFjaCBzbmRfc29j
X2FjcGlfYW1kX2FjcDcwX3Nkd19tYWNoaW5lc1tdID0gewogCQkubGlua3MgPSBhY3A3MF9jczM1
bDYzeDRfbDB1MDI0NiwKIAkJLmRydl9uYW1lID0gImFtZF9zZHciLAogCX0sCisJeworCQkubGlu
a19tYXNrID0gQklUKDEpLAorCQkubGlua3MgPSBhY3A3MF9ydDcyMV9vbmx5LAorCQkuZHJ2X25h
bWUgPSAiYW1kX3NkdyIsCisJfSwKIAl7CiAJCS5saW5rX21hc2sgPSBCSVQoMCksCiAJCS5saW5r
cyA9IGFjcDcwX3J0NzIyX29ubHksCi0tIAoyLjQzLjAKCg==
--0000000000007f044e065b8b4479--
