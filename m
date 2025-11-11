Received: from send003.gov-dooray.com (send003.gov-dooray.com [211.56.2.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FFB2FB0B9
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.56.2.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762868128; cv=none; b=ALck/8AsXF8q13fP2MHtdz3fbpMrfoUDCXbqbeq6D3C9unK538Gzb7BrVrtHkmvtpK8MW0C36JPvxfSgAvUpfWuNXKIXrFwyT3q8qFRZJP3qKvTOB8wEwPwIFsNEYjEMR4bj9Idn9zc8DP8H/v/SrjoNYctZe72JsfQwTfJDmeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762868128; c=relaxed/simple;
	bh=9PwxNqUPdFkF3zV37eZzJQ2T9hDoANL3JMI9eEC2LHE=;
	h=From:To:Message-ID:Subject:MIME-Version:Content-Type:Cc:Date; b=hfoQvyQKzh1pflT7nHwmkB7zj0oyBvNy/cf7DUZUJMR1rdQQokIA2VN+GfUjdUQ2aWHKc71ho+QifNNtjoWQrmYjm4XrS0WDAgvhkTmWdiZmIHGbIDX88/oPpkY+rcY7CeIH/7ZNeWQVVBLOyo17Ev8zfQsxxQGiS0GkmFNFS7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kaist.ac.kr; spf=pass smtp.mailfrom=kaist.ac.kr; dkim=pass (2048-bit key) header.d=kaist.ac.kr header.i=@kaist.ac.kr header.b=Qw6dvYz/; arc=none smtp.client-ip=211.56.2.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kaist.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaist.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kaist.ac.kr header.i=@kaist.ac.kr header.b="Qw6dvYz/"
DKIM-Signature: a=rsa-sha256;
 b=Qw6dvYz/IpP3nvlByRyhk3jnNca8PDZ37/pDannXJiI3MeiZ70ifRaCS2afJUEc7epuHn+6xjc
  yy+Sz94imJiNvQ4FmZ/2WSuLLIbe790FYF36wKB+PE9KEU/BGJCCh8y8AN59gmNZXEmoCwg3pBql
  PW9W69p3yQZqaiP9Lh/GnvnED+XgIQp7LbE6IojjyYnHQoXio5uboG74p7tkSmhfHQw3e1fqUmnr
  KmGqzjcY9PkFE4Vy/F+mmcQ4zdYHRSXO/krRbt3ojlZrs9462b/ZfRRoWqYvXAqE3ATQ8k30KuQP
  qzD76BechbTSJiplwykvivOfxGQ8K6l2NNbWGK2A==;
 c=relaxed/relaxed; s=dooray; d=kaist.ac.kr; v=1;
 bh=9PwxNqUPdFkF3zV37eZzJQ2T9hDoANL3JMI9eEC2LHE=;
 h=From:To:Subject:Message-ID;
Dooray-Meta-Signature: VkQlEExHSdyddpc7SThGQn/fMSc0fuOH0ZxkPoYD0d54jFwj4uHiX
  kqVz71SN5+gpNdmjwyNDuTnnrvk3LuwAp67hZuqvy66co7oGDaA0i0WgJHQzW4jWuX1mgcPtBed/
  NuFTfC6HNwhX1jjTdswcHIam5CHwFtoykRBdU5EX1uWP6BSWAV7dIghyaNO21GTFVP5s8y6TPsYN
  pSJJ9ws7KJDq0g+SmNAUj6/S+SPs1ig+kjelb3zJouvP7C4v1j51Y0KV1ffk2P53KiKMfD1HwPZQ
  Aehxjpcg4JLgzhjyTnT8MR9KdjfjYgdr7VvDY7PNYkVW4JjYdWal1rI7oZs1vkYeEBz05SvJC/I5
  xceVsY=
Received: from [143.248.56.91] (HELO 143.248.56.91) ([143.248.56.91]) by
 send003.gov-dooray.com with SMTP id 15fda88f69133b9b; Tue, 11 Nov 2025
 22:35:23 +0900
From: Haein Lee <lhi0729@kaist.ac.kr>
To: perex@perex.cz, Takashi Iwai <tiwai@suse.de>
Message-ID: <vwhdiz65lpej.vwhdiz62bsc0.g5@dooray.com>
Subject: =?UTF-8?B?W1BBVENIIHYyXSBBTFNBOiB1c2ItYXVkaW86IEZpeCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgaW4gc25kX3VzYl9taXhlcl9jb250cm9sc19iYWRk?=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
X-Dsn-Request: true
X-Dooray-Agent: mail-api
X-Dooray-Mail-Id: 4199034569998999771
Importance: Normal
X-Priority: Normal
X-MSMail-Priority: Normal
X-Dooray-Attached: c3+LUOpPU/IB7Wl+oemm0lw5HiI/bJHHYClX72L8E3o=
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Sender: "Haein Lee" <lhi0729@kaist.ac.kr>
X-Dooray-Big-Attached: false
X-Dooray-ClientIp: 143.248.56.91
Date: Tue, 11 Nov 2025 22:35:22 +0900 (KST)

SW4gc25kX3VzYl9jcmVhdGVfc3RyZWFtcygpLCBmb3IgVUFDIHZlcnNpb24gMyBkZXZpY2VzLCB0
aGUgSW50ZXJmYWNlCkFzc29jaWF0aW9uIERlc2NyaXB0b3IgKElBRCkgaXMgcmV0cmlldmVkIHZp
YSB1c2JfaWZudW1fdG9faWYoKS4gSWYgdGhpcwpjYWxsIGZhaWxzLCBhIGZhbGxiYWNrIHJvdXRp
bmUgYXR0ZW1wdHMgdG8gb2J0YWluIHRoZSBJQUQgZnJvbSB0aGUgbmV4dAppbnRlcmZhY2UgYW5k
IHNldHMgYSBCQUREIHByb2ZpbGUuIEhvd2V2ZXIsIHNuZF91c2JfbWl4ZXJfY29udHJvbHNfYmFk
ZCgpCmFzc3VtZXMgdGhhdCB0aGUgSUFEIHJldHJpZXZlZCBmcm9tIHVzYl9pZm51bV90b19pZigp
IGlzIGFsd2F5cyB2YWxpZCwKd2l0aG91dCBwZXJmb3JtaW5nIGEgTlVMTCBjaGVjay4gVGhpcyBj
YW4gbGVhZCB0byBhIE5VTEwgcG9pbnRlcgpkZXJlZmVyZW5jZSB3aGVuIHVzYl9pZm51bV90b19p
ZigpIGZhaWxzIHRvIGZpbmQgdGhlIGludGVyZmFjZSBkZXNjcmlwdG9yLgoKVGhpcyBwYXRjaCBh
ZGRzIGEgTlVMTCBwb2ludGVyIGNoZWNrIGFmdGVyIGNhbGxpbmcgdXNiX2lmbnVtX3RvX2lmKCkg
aW4Kc25kX3VzYl9taXhlcl9jb250cm9sc19iYWRkKCkgdG8gcHJldmVudCB0aGUgZGVyZWZlcmVu
Y2UuCgpUaGlzIGlzc3VlIHdhcyBkaXNjb3ZlcmVkIGJ5IHN5emthbGxlciwgd2hpY2ggdHJpZ2dl
cmVkIHRoZSBidWcgYnkgc2VuZGluZwphIGNyYWZ0ZWQgVVNCIGRldmljZSBkZXNjcmlwdG9yLgot
LS0KIHNvdW5kL3VzYi9taXhlci5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3VzYi9taXhlci5jIGIvc291bmQvdXNiL21peGVyLmMK
aW5kZXggNmYwMGUwZDUyMzgyLi43MmI5MDA1MDVkMmMgMTAwNjQ0Ci0tLSBhL3NvdW5kL3VzYi9t
aXhlci5jCisrKyBiL3NvdW5kL3VzYi9taXhlci5jCkBAIC0zMDg2LDYgKzMwODYsOCBAQCBzdGF0
aWMgaW50IHNuZF91c2JfbWl4ZXJfY29udHJvbHNfYmFkZChzdHJ1Y3QgdXNiX21peGVyX2ludGVy
ZmFjZSAqbWl4ZXIsCiAJaW50IGk7CiAKIAlhc3NvYyA9IHVzYl9pZm51bV90b19pZihkZXYsIGN0
cmxpZiktPmludGZfYXNzb2M7CisJaWYgKCFhc3NvYykKKwkJcmV0dXJuIC1FSU5WQUw7CiAKIAkv
KiBEZXRlY3QgQkFERCBjYXB0dXJlL3BsYXliYWNrIGNoYW5uZWxzIGZyb20gQVMgRVAgZGVzY3Jp
cHRvcnMgKi8KIAlmb3IgKGkgPSAwOyBpIDwgYXNzb2MtPmJJbnRlcmZhY2VDb3VudDsgaSsrKSB7
Ci0tIAoyLjM0LjEKCg==

